; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_12.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_12_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !31
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #5, !dbg !32
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !35
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #5, !dbg !36
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !37
  store i32 0, i32* %arrayidx3, align 4, !dbg !38
  %call4 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !39
  %tobool = icmp ne i32 %call4, 0, !dbg !39
  br i1 %tobool, label %if.then, label %if.else, !dbg !41

if.then:                                          ; preds = %entry
  %arraydecay5 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !42
  store i32* %arraydecay5, i32** %data, align 8, !dbg !44
  br label %if.end, !dbg !45

if.else:                                          ; preds = %entry
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !46
  store i32* %arraydecay6, i32** %data, align 8, !dbg !48
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !49, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !56, metadata !DIExpression()), !dbg !57
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !58
  %call8 = call i32* @wmemset(i32* %arraydecay7, i32 67, i64 99) #5, !dbg !59
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !60
  store i32 0, i32* %arrayidx9, align 4, !dbg !61
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !62
  %call11 = call i64 @wcslen(i32* %arraydecay10) #6, !dbg !63
  store i64 %call11, i64* %destLen, align 8, !dbg !64
  store i64 0, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !67

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !68
  %1 = load i64, i64* %destLen, align 8, !dbg !70
  %cmp = icmp ult i64 %0, %1, !dbg !71
  br i1 %cmp, label %for.body, label %for.end, !dbg !72

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !73
  %3 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx12 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !73
  %4 = load i32, i32* %arrayidx12, align 4, !dbg !73
  %5 = load i64, i64* %i, align 8, !dbg !76
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !77
  store i32 %4, i32* %arrayidx13, align 4, !dbg !78
  br label %for.inc, !dbg !79

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !80
  %inc = add i64 %6, 1, !dbg !80
  store i64 %inc, i64* %i, align 8, !dbg !80
  br label %for.cond, !dbg !81, !llvm.loop !82

for.end:                                          ; preds = %for.cond
  %arrayidx14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !85
  store i32 0, i32* %arrayidx14, align 4, !dbg !86
  %arraydecay15 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !87
  call void @printWLine(i32* %arraydecay15), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local i32 @globalReturnsTrueOrFalse(...) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_12_good() #0 !dbg !90 {
entry:
  call void @goodG2B(), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !93 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !99, metadata !DIExpression()), !dbg !100
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !101, metadata !DIExpression()), !dbg !102
  %call = call i64 @time(i64* null) #5, !dbg !103
  %conv = trunc i64 %call to i32, !dbg !104
  call void @srand(i32 %conv) #5, !dbg !105
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !106
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_12_good(), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !109
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_12_bad(), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !111
  ret i32 0, !dbg !112
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !113 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !120
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #5, !dbg !121
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !122
  store i32 0, i32* %arrayidx, align 4, !dbg !123
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !124
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #5, !dbg !125
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !126
  store i32 0, i32* %arrayidx3, align 4, !dbg !127
  %call4 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !128
  %tobool = icmp ne i32 %call4, 0, !dbg !128
  br i1 %tobool, label %if.then, label %if.else, !dbg !130

if.then:                                          ; preds = %entry
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !131
  store i32* %arraydecay5, i32** %data, align 8, !dbg !133
  br label %if.end, !dbg !134

if.else:                                          ; preds = %entry
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !135
  store i32* %arraydecay6, i32** %data, align 8, !dbg !137
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !138, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !141, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !143, metadata !DIExpression()), !dbg !144
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !145
  %call8 = call i32* @wmemset(i32* %arraydecay7, i32 67, i64 99) #5, !dbg !146
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !147
  store i32 0, i32* %arrayidx9, align 4, !dbg !148
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !149
  %call11 = call i64 @wcslen(i32* %arraydecay10) #6, !dbg !150
  store i64 %call11, i64* %destLen, align 8, !dbg !151
  store i64 0, i64* %i, align 8, !dbg !152
  br label %for.cond, !dbg !154

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !155
  %1 = load i64, i64* %destLen, align 8, !dbg !157
  %cmp = icmp ult i64 %0, %1, !dbg !158
  br i1 %cmp, label %for.body, label %for.end, !dbg !159

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !160
  %3 = load i64, i64* %i, align 8, !dbg !162
  %arrayidx12 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !160
  %4 = load i32, i32* %arrayidx12, align 4, !dbg !160
  %5 = load i64, i64* %i, align 8, !dbg !163
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !164
  store i32 %4, i32* %arrayidx13, align 4, !dbg !165
  br label %for.inc, !dbg !166

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !167
  %inc = add i64 %6, 1, !dbg !167
  store i64 %inc, i64* %i, align 8, !dbg !167
  br label %for.cond, !dbg !168, !llvm.loop !169

for.end:                                          ; preds = %for.cond
  %arrayidx14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !171
  store i32 0, i32* %arrayidx14, align 4, !dbg !172
  %arraydecay15 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !173
  call void @printWLine(i32* %arraydecay15), !dbg !174
  ret void, !dbg !175
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_12_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 50)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 27, column: 13, scope: !11)
!31 = !DILocation(line: 28, column: 13, scope: !11)
!32 = !DILocation(line: 28, column: 5, scope: !11)
!33 = !DILocation(line: 29, column: 5, scope: !11)
!34 = !DILocation(line: 29, column: 25, scope: !11)
!35 = !DILocation(line: 30, column: 13, scope: !11)
!36 = !DILocation(line: 30, column: 5, scope: !11)
!37 = !DILocation(line: 31, column: 5, scope: !11)
!38 = !DILocation(line: 31, column: 27, scope: !11)
!39 = !DILocation(line: 32, column: 8, scope: !40)
!40 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 8)
!41 = !DILocation(line: 32, column: 8, scope: !11)
!42 = !DILocation(line: 35, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !12, line: 33, column: 5)
!44 = !DILocation(line: 35, column: 14, scope: !43)
!45 = !DILocation(line: 36, column: 5, scope: !43)
!46 = !DILocation(line: 40, column: 16, scope: !47)
!47 = distinct !DILexicalBlock(scope: !40, file: !12, line: 38, column: 5)
!48 = !DILocation(line: 40, column: 14, scope: !47)
!49 = !DILocalVariable(name: "i", scope: !50, file: !12, line: 43, type: !51)
!50 = distinct !DILexicalBlock(scope: !11, file: !12, line: 42, column: 5)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !52)
!52 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!53 = !DILocation(line: 43, column: 16, scope: !50)
!54 = !DILocalVariable(name: "destLen", scope: !50, file: !12, line: 43, type: !51)
!55 = !DILocation(line: 43, column: 19, scope: !50)
!56 = !DILocalVariable(name: "dest", scope: !50, file: !12, line: 44, type: !27)
!57 = !DILocation(line: 44, column: 17, scope: !50)
!58 = !DILocation(line: 45, column: 17, scope: !50)
!59 = !DILocation(line: 45, column: 9, scope: !50)
!60 = !DILocation(line: 46, column: 9, scope: !50)
!61 = !DILocation(line: 46, column: 21, scope: !50)
!62 = !DILocation(line: 47, column: 26, scope: !50)
!63 = !DILocation(line: 47, column: 19, scope: !50)
!64 = !DILocation(line: 47, column: 17, scope: !50)
!65 = !DILocation(line: 50, column: 16, scope: !66)
!66 = distinct !DILexicalBlock(scope: !50, file: !12, line: 50, column: 9)
!67 = !DILocation(line: 50, column: 14, scope: !66)
!68 = !DILocation(line: 50, column: 21, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !12, line: 50, column: 9)
!70 = !DILocation(line: 50, column: 25, scope: !69)
!71 = !DILocation(line: 50, column: 23, scope: !69)
!72 = !DILocation(line: 50, column: 9, scope: !66)
!73 = !DILocation(line: 52, column: 23, scope: !74)
!74 = distinct !DILexicalBlock(scope: !69, file: !12, line: 51, column: 9)
!75 = !DILocation(line: 52, column: 28, scope: !74)
!76 = !DILocation(line: 52, column: 18, scope: !74)
!77 = !DILocation(line: 52, column: 13, scope: !74)
!78 = !DILocation(line: 52, column: 21, scope: !74)
!79 = !DILocation(line: 53, column: 9, scope: !74)
!80 = !DILocation(line: 50, column: 35, scope: !69)
!81 = !DILocation(line: 50, column: 9, scope: !69)
!82 = distinct !{!82, !72, !83, !84}
!83 = !DILocation(line: 53, column: 9, scope: !66)
!84 = !{!"llvm.loop.mustprogress"}
!85 = !DILocation(line: 54, column: 9, scope: !50)
!86 = !DILocation(line: 54, column: 21, scope: !50)
!87 = !DILocation(line: 55, column: 20, scope: !50)
!88 = !DILocation(line: 55, column: 9, scope: !50)
!89 = !DILocation(line: 57, column: 1, scope: !11)
!90 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_12_good", scope: !12, file: !12, line: 101, type: !13, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocation(line: 103, column: 5, scope: !90)
!92 = !DILocation(line: 104, column: 1, scope: !90)
!93 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 116, type: !94, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DISubroutineType(types: !95)
!95 = !{!19, !19, !96}
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!99 = !DILocalVariable(name: "argc", arg: 1, scope: !93, file: !12, line: 116, type: !19)
!100 = !DILocation(line: 116, column: 14, scope: !93)
!101 = !DILocalVariable(name: "argv", arg: 2, scope: !93, file: !12, line: 116, type: !96)
!102 = !DILocation(line: 116, column: 27, scope: !93)
!103 = !DILocation(line: 119, column: 22, scope: !93)
!104 = !DILocation(line: 119, column: 12, scope: !93)
!105 = !DILocation(line: 119, column: 5, scope: !93)
!106 = !DILocation(line: 121, column: 5, scope: !93)
!107 = !DILocation(line: 122, column: 5, scope: !93)
!108 = !DILocation(line: 123, column: 5, scope: !93)
!109 = !DILocation(line: 126, column: 5, scope: !93)
!110 = !DILocation(line: 127, column: 5, scope: !93)
!111 = !DILocation(line: 128, column: 5, scope: !93)
!112 = !DILocation(line: 130, column: 5, scope: !93)
!113 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocalVariable(name: "data", scope: !113, file: !12, line: 67, type: !16)
!115 = !DILocation(line: 67, column: 15, scope: !113)
!116 = !DILocalVariable(name: "dataBadBuffer", scope: !113, file: !12, line: 68, type: !22)
!117 = !DILocation(line: 68, column: 13, scope: !113)
!118 = !DILocalVariable(name: "dataGoodBuffer", scope: !113, file: !12, line: 69, type: !27)
!119 = !DILocation(line: 69, column: 13, scope: !113)
!120 = !DILocation(line: 70, column: 13, scope: !113)
!121 = !DILocation(line: 70, column: 5, scope: !113)
!122 = !DILocation(line: 71, column: 5, scope: !113)
!123 = !DILocation(line: 71, column: 25, scope: !113)
!124 = !DILocation(line: 72, column: 13, scope: !113)
!125 = !DILocation(line: 72, column: 5, scope: !113)
!126 = !DILocation(line: 73, column: 5, scope: !113)
!127 = !DILocation(line: 73, column: 27, scope: !113)
!128 = !DILocation(line: 74, column: 8, scope: !129)
!129 = distinct !DILexicalBlock(scope: !113, file: !12, line: 74, column: 8)
!130 = !DILocation(line: 74, column: 8, scope: !113)
!131 = !DILocation(line: 77, column: 16, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !12, line: 75, column: 5)
!133 = !DILocation(line: 77, column: 14, scope: !132)
!134 = !DILocation(line: 78, column: 5, scope: !132)
!135 = !DILocation(line: 82, column: 16, scope: !136)
!136 = distinct !DILexicalBlock(scope: !129, file: !12, line: 80, column: 5)
!137 = !DILocation(line: 82, column: 14, scope: !136)
!138 = !DILocalVariable(name: "i", scope: !139, file: !12, line: 85, type: !51)
!139 = distinct !DILexicalBlock(scope: !113, file: !12, line: 84, column: 5)
!140 = !DILocation(line: 85, column: 16, scope: !139)
!141 = !DILocalVariable(name: "destLen", scope: !139, file: !12, line: 85, type: !51)
!142 = !DILocation(line: 85, column: 19, scope: !139)
!143 = !DILocalVariable(name: "dest", scope: !139, file: !12, line: 86, type: !27)
!144 = !DILocation(line: 86, column: 17, scope: !139)
!145 = !DILocation(line: 87, column: 17, scope: !139)
!146 = !DILocation(line: 87, column: 9, scope: !139)
!147 = !DILocation(line: 88, column: 9, scope: !139)
!148 = !DILocation(line: 88, column: 21, scope: !139)
!149 = !DILocation(line: 89, column: 26, scope: !139)
!150 = !DILocation(line: 89, column: 19, scope: !139)
!151 = !DILocation(line: 89, column: 17, scope: !139)
!152 = !DILocation(line: 92, column: 16, scope: !153)
!153 = distinct !DILexicalBlock(scope: !139, file: !12, line: 92, column: 9)
!154 = !DILocation(line: 92, column: 14, scope: !153)
!155 = !DILocation(line: 92, column: 21, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !12, line: 92, column: 9)
!157 = !DILocation(line: 92, column: 25, scope: !156)
!158 = !DILocation(line: 92, column: 23, scope: !156)
!159 = !DILocation(line: 92, column: 9, scope: !153)
!160 = !DILocation(line: 94, column: 23, scope: !161)
!161 = distinct !DILexicalBlock(scope: !156, file: !12, line: 93, column: 9)
!162 = !DILocation(line: 94, column: 28, scope: !161)
!163 = !DILocation(line: 94, column: 18, scope: !161)
!164 = !DILocation(line: 94, column: 13, scope: !161)
!165 = !DILocation(line: 94, column: 21, scope: !161)
!166 = !DILocation(line: 95, column: 9, scope: !161)
!167 = !DILocation(line: 92, column: 35, scope: !156)
!168 = !DILocation(line: 92, column: 9, scope: !156)
!169 = distinct !{!169, !159, !170, !84}
!170 = !DILocation(line: 95, column: 9, scope: !153)
!171 = !DILocation(line: 96, column: 9, scope: !139)
!172 = !DILocation(line: 96, column: 21, scope: !139)
!173 = !DILocation(line: 97, column: 20, scope: !139)
!174 = !DILocation(line: 97, column: 9, scope: !139)
!175 = !DILocation(line: 99, column: 1, scope: !113)
