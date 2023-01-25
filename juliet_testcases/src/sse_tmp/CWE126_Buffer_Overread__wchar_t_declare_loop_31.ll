; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_31.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data5 = alloca i32*, align 8
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
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  store i32* %arraydecay4, i32** %data, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !41, metadata !DIExpression()), !dbg !43
  %0 = load i32*, i32** %data, align 8, !dbg !44
  store i32* %0, i32** %dataCopy, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i32** %data5, metadata !45, metadata !DIExpression()), !dbg !46
  %1 = load i32*, i32** %dataCopy, align 8, !dbg !47
  store i32* %1, i32** %data5, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata i64* %i, metadata !48, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !55, metadata !DIExpression()), !dbg !56
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !57
  %call7 = call i32* @wmemset(i32* %arraydecay6, i32 67, i64 99) #5, !dbg !58
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !59
  store i32 0, i32* %arrayidx8, align 4, !dbg !60
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !61
  %call10 = call i64 @wcslen(i32* %arraydecay9) #6, !dbg !62
  store i64 %call10, i64* %destLen, align 8, !dbg !63
  store i64 0, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !66

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !67
  %3 = load i64, i64* %destLen, align 8, !dbg !69
  %cmp = icmp ult i64 %2, %3, !dbg !70
  br i1 %cmp, label %for.body, label %for.end, !dbg !71

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %data5, align 8, !dbg !72
  %5 = load i64, i64* %i, align 8, !dbg !74
  %arrayidx11 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !72
  %6 = load i32, i32* %arrayidx11, align 4, !dbg !72
  %7 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %7, !dbg !76
  store i32 %6, i32* %arrayidx12, align 4, !dbg !77
  br label %for.inc, !dbg !78

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !79
  %inc = add i64 %8, 1, !dbg !79
  store i64 %inc, i64* %i, align 8, !dbg !79
  br label %for.cond, !dbg !80, !llvm.loop !81

for.end:                                          ; preds = %for.cond
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !84
  store i32 0, i32* %arrayidx13, align 4, !dbg !85
  %arraydecay14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !86
  call void @printWLine(i32* %arraydecay14), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_31_good() #0 !dbg !89 {
entry:
  call void @goodG2B(), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !92 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !98, metadata !DIExpression()), !dbg !99
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !100, metadata !DIExpression()), !dbg !101
  %call = call i64 @time(i64* null) #5, !dbg !102
  %conv = trunc i64 %call to i32, !dbg !103
  call void @srand(i32 %conv) #5, !dbg !104
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !105
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_31_good(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !108
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_31_bad(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !110
  ret i32 0, !dbg !111
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !112 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data5 = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !119
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #5, !dbg !120
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !121
  store i32 0, i32* %arrayidx, align 4, !dbg !122
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !123
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #5, !dbg !124
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !125
  store i32 0, i32* %arrayidx3, align 4, !dbg !126
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !127
  store i32* %arraydecay4, i32** %data, align 8, !dbg !128
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !129, metadata !DIExpression()), !dbg !131
  %0 = load i32*, i32** %data, align 8, !dbg !132
  store i32* %0, i32** %dataCopy, align 8, !dbg !131
  call void @llvm.dbg.declare(metadata i32** %data5, metadata !133, metadata !DIExpression()), !dbg !134
  %1 = load i32*, i32** %dataCopy, align 8, !dbg !135
  store i32* %1, i32** %data5, align 8, !dbg !134
  call void @llvm.dbg.declare(metadata i64* %i, metadata !136, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !139, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !141, metadata !DIExpression()), !dbg !142
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !143
  %call7 = call i32* @wmemset(i32* %arraydecay6, i32 67, i64 99) #5, !dbg !144
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !145
  store i32 0, i32* %arrayidx8, align 4, !dbg !146
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !147
  %call10 = call i64 @wcslen(i32* %arraydecay9) #6, !dbg !148
  store i64 %call10, i64* %destLen, align 8, !dbg !149
  store i64 0, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !152

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !153
  %3 = load i64, i64* %destLen, align 8, !dbg !155
  %cmp = icmp ult i64 %2, %3, !dbg !156
  br i1 %cmp, label %for.body, label %for.end, !dbg !157

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %data5, align 8, !dbg !158
  %5 = load i64, i64* %i, align 8, !dbg !160
  %arrayidx11 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !158
  %6 = load i32, i32* %arrayidx11, align 4, !dbg !158
  %7 = load i64, i64* %i, align 8, !dbg !161
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %7, !dbg !162
  store i32 %6, i32* %arrayidx12, align 4, !dbg !163
  br label %for.inc, !dbg !164

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !165
  %inc = add i64 %8, 1, !dbg !165
  store i64 %inc, i64* %i, align 8, !dbg !165
  br label %for.cond, !dbg !166, !llvm.loop !167

for.end:                                          ; preds = %for.cond
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !169
  store i32 0, i32* %arrayidx13, align 4, !dbg !170
  %arraydecay14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !171
  call void @printWLine(i32* %arraydecay14), !dbg !172
  ret void, !dbg !173
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_31_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!39 = !DILocation(line: 33, column: 12, scope: !11)
!40 = !DILocation(line: 33, column: 10, scope: !11)
!41 = !DILocalVariable(name: "dataCopy", scope: !42, file: !12, line: 35, type: !16)
!42 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!43 = !DILocation(line: 35, column: 19, scope: !42)
!44 = !DILocation(line: 35, column: 30, scope: !42)
!45 = !DILocalVariable(name: "data", scope: !42, file: !12, line: 36, type: !16)
!46 = !DILocation(line: 36, column: 19, scope: !42)
!47 = !DILocation(line: 36, column: 26, scope: !42)
!48 = !DILocalVariable(name: "i", scope: !49, file: !12, line: 38, type: !50)
!49 = distinct !DILexicalBlock(scope: !42, file: !12, line: 37, column: 9)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !51)
!51 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 38, column: 20, scope: !49)
!53 = !DILocalVariable(name: "destLen", scope: !49, file: !12, line: 38, type: !50)
!54 = !DILocation(line: 38, column: 23, scope: !49)
!55 = !DILocalVariable(name: "dest", scope: !49, file: !12, line: 39, type: !27)
!56 = !DILocation(line: 39, column: 21, scope: !49)
!57 = !DILocation(line: 40, column: 21, scope: !49)
!58 = !DILocation(line: 40, column: 13, scope: !49)
!59 = !DILocation(line: 41, column: 13, scope: !49)
!60 = !DILocation(line: 41, column: 25, scope: !49)
!61 = !DILocation(line: 42, column: 30, scope: !49)
!62 = !DILocation(line: 42, column: 23, scope: !49)
!63 = !DILocation(line: 42, column: 21, scope: !49)
!64 = !DILocation(line: 45, column: 20, scope: !65)
!65 = distinct !DILexicalBlock(scope: !49, file: !12, line: 45, column: 13)
!66 = !DILocation(line: 45, column: 18, scope: !65)
!67 = !DILocation(line: 45, column: 25, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !12, line: 45, column: 13)
!69 = !DILocation(line: 45, column: 29, scope: !68)
!70 = !DILocation(line: 45, column: 27, scope: !68)
!71 = !DILocation(line: 45, column: 13, scope: !65)
!72 = !DILocation(line: 47, column: 27, scope: !73)
!73 = distinct !DILexicalBlock(scope: !68, file: !12, line: 46, column: 13)
!74 = !DILocation(line: 47, column: 32, scope: !73)
!75 = !DILocation(line: 47, column: 22, scope: !73)
!76 = !DILocation(line: 47, column: 17, scope: !73)
!77 = !DILocation(line: 47, column: 25, scope: !73)
!78 = !DILocation(line: 48, column: 13, scope: !73)
!79 = !DILocation(line: 45, column: 39, scope: !68)
!80 = !DILocation(line: 45, column: 13, scope: !68)
!81 = distinct !{!81, !71, !82, !83}
!82 = !DILocation(line: 48, column: 13, scope: !65)
!83 = !{!"llvm.loop.mustprogress"}
!84 = !DILocation(line: 49, column: 13, scope: !49)
!85 = !DILocation(line: 49, column: 25, scope: !49)
!86 = !DILocation(line: 50, column: 24, scope: !49)
!87 = !DILocation(line: 50, column: 13, scope: !49)
!88 = !DILocation(line: 53, column: 1, scope: !11)
!89 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_31_good", scope: !12, file: !12, line: 92, type: !13, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocation(line: 94, column: 5, scope: !89)
!91 = !DILocation(line: 95, column: 1, scope: !89)
!92 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 106, type: !93, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DISubroutineType(types: !94)
!94 = !{!19, !19, !95}
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!98 = !DILocalVariable(name: "argc", arg: 1, scope: !92, file: !12, line: 106, type: !19)
!99 = !DILocation(line: 106, column: 14, scope: !92)
!100 = !DILocalVariable(name: "argv", arg: 2, scope: !92, file: !12, line: 106, type: !95)
!101 = !DILocation(line: 106, column: 27, scope: !92)
!102 = !DILocation(line: 109, column: 22, scope: !92)
!103 = !DILocation(line: 109, column: 12, scope: !92)
!104 = !DILocation(line: 109, column: 5, scope: !92)
!105 = !DILocation(line: 111, column: 5, scope: !92)
!106 = !DILocation(line: 112, column: 5, scope: !92)
!107 = !DILocation(line: 113, column: 5, scope: !92)
!108 = !DILocation(line: 116, column: 5, scope: !92)
!109 = !DILocation(line: 117, column: 5, scope: !92)
!110 = !DILocation(line: 118, column: 5, scope: !92)
!111 = !DILocation(line: 120, column: 5, scope: !92)
!112 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "data", scope: !112, file: !12, line: 62, type: !16)
!114 = !DILocation(line: 62, column: 15, scope: !112)
!115 = !DILocalVariable(name: "dataBadBuffer", scope: !112, file: !12, line: 63, type: !22)
!116 = !DILocation(line: 63, column: 13, scope: !112)
!117 = !DILocalVariable(name: "dataGoodBuffer", scope: !112, file: !12, line: 64, type: !27)
!118 = !DILocation(line: 64, column: 13, scope: !112)
!119 = !DILocation(line: 65, column: 13, scope: !112)
!120 = !DILocation(line: 65, column: 5, scope: !112)
!121 = !DILocation(line: 66, column: 5, scope: !112)
!122 = !DILocation(line: 66, column: 25, scope: !112)
!123 = !DILocation(line: 67, column: 13, scope: !112)
!124 = !DILocation(line: 67, column: 5, scope: !112)
!125 = !DILocation(line: 68, column: 5, scope: !112)
!126 = !DILocation(line: 68, column: 27, scope: !112)
!127 = !DILocation(line: 70, column: 12, scope: !112)
!128 = !DILocation(line: 70, column: 10, scope: !112)
!129 = !DILocalVariable(name: "dataCopy", scope: !130, file: !12, line: 72, type: !16)
!130 = distinct !DILexicalBlock(scope: !112, file: !12, line: 71, column: 5)
!131 = !DILocation(line: 72, column: 19, scope: !130)
!132 = !DILocation(line: 72, column: 30, scope: !130)
!133 = !DILocalVariable(name: "data", scope: !130, file: !12, line: 73, type: !16)
!134 = !DILocation(line: 73, column: 19, scope: !130)
!135 = !DILocation(line: 73, column: 26, scope: !130)
!136 = !DILocalVariable(name: "i", scope: !137, file: !12, line: 75, type: !50)
!137 = distinct !DILexicalBlock(scope: !130, file: !12, line: 74, column: 9)
!138 = !DILocation(line: 75, column: 20, scope: !137)
!139 = !DILocalVariable(name: "destLen", scope: !137, file: !12, line: 75, type: !50)
!140 = !DILocation(line: 75, column: 23, scope: !137)
!141 = !DILocalVariable(name: "dest", scope: !137, file: !12, line: 76, type: !27)
!142 = !DILocation(line: 76, column: 21, scope: !137)
!143 = !DILocation(line: 77, column: 21, scope: !137)
!144 = !DILocation(line: 77, column: 13, scope: !137)
!145 = !DILocation(line: 78, column: 13, scope: !137)
!146 = !DILocation(line: 78, column: 25, scope: !137)
!147 = !DILocation(line: 79, column: 30, scope: !137)
!148 = !DILocation(line: 79, column: 23, scope: !137)
!149 = !DILocation(line: 79, column: 21, scope: !137)
!150 = !DILocation(line: 82, column: 20, scope: !151)
!151 = distinct !DILexicalBlock(scope: !137, file: !12, line: 82, column: 13)
!152 = !DILocation(line: 82, column: 18, scope: !151)
!153 = !DILocation(line: 82, column: 25, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !12, line: 82, column: 13)
!155 = !DILocation(line: 82, column: 29, scope: !154)
!156 = !DILocation(line: 82, column: 27, scope: !154)
!157 = !DILocation(line: 82, column: 13, scope: !151)
!158 = !DILocation(line: 84, column: 27, scope: !159)
!159 = distinct !DILexicalBlock(scope: !154, file: !12, line: 83, column: 13)
!160 = !DILocation(line: 84, column: 32, scope: !159)
!161 = !DILocation(line: 84, column: 22, scope: !159)
!162 = !DILocation(line: 84, column: 17, scope: !159)
!163 = !DILocation(line: 84, column: 25, scope: !159)
!164 = !DILocation(line: 85, column: 13, scope: !159)
!165 = !DILocation(line: 82, column: 39, scope: !154)
!166 = !DILocation(line: 82, column: 13, scope: !154)
!167 = distinct !{!167, !157, !168, !83}
!168 = !DILocation(line: 85, column: 13, scope: !151)
!169 = !DILocation(line: 86, column: 13, scope: !137)
!170 = !DILocation(line: 86, column: 25, scope: !137)
!171 = !DILocation(line: 87, column: 24, scope: !137)
!172 = !DILocation(line: 87, column: 13, scope: !137)
!173 = !DILocation(line: 90, column: 1, scope: !112)
