; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_12.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_12_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 200, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 400, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !29
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !30
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !33
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #5, !dbg !34
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !35
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !35
  store i32 0, i32* %arrayidx2, align 4, !dbg !36
  %call3 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !37
  %tobool = icmp ne i32 %call3, 0, !dbg !37
  br i1 %tobool, label %if.then, label %if.else, !dbg !39

if.then:                                          ; preds = %entry
  %8 = load i32*, i32** %dataBadBuffer, align 8, !dbg !40
  store i32* %8, i32** %data, align 8, !dbg !42
  br label %if.end, !dbg !43

if.else:                                          ; preds = %entry
  %9 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !44
  store i32* %9, i32** %data, align 8, !dbg !46
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !54, metadata !DIExpression()), !dbg !58
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !59
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !60
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !61
  store i32 0, i32* %arrayidx5, align 4, !dbg !62
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !63
  %call7 = call i64 @wcslen(i32* %arraydecay6) #6, !dbg !64
  store i64 %call7, i64* %destLen, align 8, !dbg !65
  store i64 0, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !68

for.cond:                                         ; preds = %for.inc, %if.end
  %10 = load i64, i64* %i, align 8, !dbg !69
  %11 = load i64, i64* %destLen, align 8, !dbg !71
  %cmp = icmp ult i64 %10, %11, !dbg !72
  br i1 %cmp, label %for.body, label %for.end, !dbg !73

for.body:                                         ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !74
  %13 = load i64, i64* %i, align 8, !dbg !76
  %arrayidx8 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !74
  %14 = load i32, i32* %arrayidx8, align 4, !dbg !74
  %15 = load i64, i64* %i, align 8, !dbg !77
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %15, !dbg !78
  store i32 %14, i32* %arrayidx9, align 4, !dbg !79
  br label %for.inc, !dbg !80

for.inc:                                          ; preds = %for.body
  %16 = load i64, i64* %i, align 8, !dbg !81
  %inc = add i64 %16, 1, !dbg !81
  store i64 %inc, i64* %i, align 8, !dbg !81
  br label %for.cond, !dbg !82, !llvm.loop !83

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !86
  store i32 0, i32* %arrayidx10, align 4, !dbg !87
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !88
  call void @printWLine(i32* %arraydecay11), !dbg !89
  ret void, !dbg !90
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
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_12_good() #0 !dbg !91 {
entry:
  call void @goodG2B(), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !94 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !100, metadata !DIExpression()), !dbg !101
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !102, metadata !DIExpression()), !dbg !103
  %call = call i64 @time(i64* null) #5, !dbg !104
  %conv = trunc i64 %call to i32, !dbg !105
  call void @srand(i32 %conv) #5, !dbg !106
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !107
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_12_good(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !110
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_12_bad(), !dbg !111
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !112
  ret i32 0, !dbg !113
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !114 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  %0 = alloca i8, i64 200, align 16, !dbg !119
  %1 = bitcast i8* %0 to i32*, !dbg !120
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !121, metadata !DIExpression()), !dbg !122
  %2 = alloca i8, i64 400, align 16, !dbg !123
  %3 = bitcast i8* %2 to i32*, !dbg !124
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !122
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !125
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !126
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !127
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !127
  store i32 0, i32* %arrayidx, align 4, !dbg !128
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !129
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #5, !dbg !130
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !131
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !131
  store i32 0, i32* %arrayidx2, align 4, !dbg !132
  %call3 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !133
  %tobool = icmp ne i32 %call3, 0, !dbg !133
  br i1 %tobool, label %if.then, label %if.else, !dbg !135

if.then:                                          ; preds = %entry
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !136
  store i32* %8, i32** %data, align 8, !dbg !138
  br label %if.end, !dbg !139

if.else:                                          ; preds = %entry
  %9 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !140
  store i32* %9, i32** %data, align 8, !dbg !142
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !143, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !146, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !148, metadata !DIExpression()), !dbg !149
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !150
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !151
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !152
  store i32 0, i32* %arrayidx5, align 4, !dbg !153
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !154
  %call7 = call i64 @wcslen(i32* %arraydecay6) #6, !dbg !155
  store i64 %call7, i64* %destLen, align 8, !dbg !156
  store i64 0, i64* %i, align 8, !dbg !157
  br label %for.cond, !dbg !159

for.cond:                                         ; preds = %for.inc, %if.end
  %10 = load i64, i64* %i, align 8, !dbg !160
  %11 = load i64, i64* %destLen, align 8, !dbg !162
  %cmp = icmp ult i64 %10, %11, !dbg !163
  br i1 %cmp, label %for.body, label %for.end, !dbg !164

for.body:                                         ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !165
  %13 = load i64, i64* %i, align 8, !dbg !167
  %arrayidx8 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !165
  %14 = load i32, i32* %arrayidx8, align 4, !dbg !165
  %15 = load i64, i64* %i, align 8, !dbg !168
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %15, !dbg !169
  store i32 %14, i32* %arrayidx9, align 4, !dbg !170
  br label %for.inc, !dbg !171

for.inc:                                          ; preds = %for.body
  %16 = load i64, i64* %i, align 8, !dbg !172
  %inc = add i64 %16, 1, !dbg !172
  store i64 %inc, i64* %i, align 8, !dbg !172
  br label %for.cond, !dbg !173, !llvm.loop !174

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !176
  store i32 0, i32* %arrayidx10, align 4, !dbg !177
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !178
  call void @printWLine(i32* %arraydecay11), !dbg !179
  ret void, !dbg !180
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_12.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_12_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_12.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 42, scope: !15)
!24 = !DILocation(line: 26, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 27, type: !4)
!26 = !DILocation(line: 27, column: 15, scope: !15)
!27 = !DILocation(line: 27, column: 43, scope: !15)
!28 = !DILocation(line: 27, column: 32, scope: !15)
!29 = !DILocation(line: 28, column: 13, scope: !15)
!30 = !DILocation(line: 28, column: 5, scope: !15)
!31 = !DILocation(line: 29, column: 5, scope: !15)
!32 = !DILocation(line: 29, column: 25, scope: !15)
!33 = !DILocation(line: 30, column: 13, scope: !15)
!34 = !DILocation(line: 30, column: 5, scope: !15)
!35 = !DILocation(line: 31, column: 5, scope: !15)
!36 = !DILocation(line: 31, column: 27, scope: !15)
!37 = !DILocation(line: 32, column: 8, scope: !38)
!38 = distinct !DILexicalBlock(scope: !15, file: !16, line: 32, column: 8)
!39 = !DILocation(line: 32, column: 8, scope: !15)
!40 = !DILocation(line: 35, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !16, line: 33, column: 5)
!42 = !DILocation(line: 35, column: 14, scope: !41)
!43 = !DILocation(line: 36, column: 5, scope: !41)
!44 = !DILocation(line: 40, column: 16, scope: !45)
!45 = distinct !DILexicalBlock(scope: !38, file: !16, line: 38, column: 5)
!46 = !DILocation(line: 40, column: 14, scope: !45)
!47 = !DILocalVariable(name: "i", scope: !48, file: !16, line: 43, type: !49)
!48 = distinct !DILexicalBlock(scope: !15, file: !16, line: 42, column: 5)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !50)
!50 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 43, column: 16, scope: !48)
!52 = !DILocalVariable(name: "destLen", scope: !48, file: !16, line: 43, type: !49)
!53 = !DILocation(line: 43, column: 19, scope: !48)
!54 = !DILocalVariable(name: "dest", scope: !48, file: !16, line: 44, type: !55)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !56)
!56 = !{!57}
!57 = !DISubrange(count: 100)
!58 = !DILocation(line: 44, column: 17, scope: !48)
!59 = !DILocation(line: 45, column: 17, scope: !48)
!60 = !DILocation(line: 45, column: 9, scope: !48)
!61 = !DILocation(line: 46, column: 9, scope: !48)
!62 = !DILocation(line: 46, column: 21, scope: !48)
!63 = !DILocation(line: 47, column: 26, scope: !48)
!64 = !DILocation(line: 47, column: 19, scope: !48)
!65 = !DILocation(line: 47, column: 17, scope: !48)
!66 = !DILocation(line: 50, column: 16, scope: !67)
!67 = distinct !DILexicalBlock(scope: !48, file: !16, line: 50, column: 9)
!68 = !DILocation(line: 50, column: 14, scope: !67)
!69 = !DILocation(line: 50, column: 21, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !16, line: 50, column: 9)
!71 = !DILocation(line: 50, column: 25, scope: !70)
!72 = !DILocation(line: 50, column: 23, scope: !70)
!73 = !DILocation(line: 50, column: 9, scope: !67)
!74 = !DILocation(line: 52, column: 23, scope: !75)
!75 = distinct !DILexicalBlock(scope: !70, file: !16, line: 51, column: 9)
!76 = !DILocation(line: 52, column: 28, scope: !75)
!77 = !DILocation(line: 52, column: 18, scope: !75)
!78 = !DILocation(line: 52, column: 13, scope: !75)
!79 = !DILocation(line: 52, column: 21, scope: !75)
!80 = !DILocation(line: 53, column: 9, scope: !75)
!81 = !DILocation(line: 50, column: 35, scope: !70)
!82 = !DILocation(line: 50, column: 9, scope: !70)
!83 = distinct !{!83, !73, !84, !85}
!84 = !DILocation(line: 53, column: 9, scope: !67)
!85 = !{!"llvm.loop.mustprogress"}
!86 = !DILocation(line: 54, column: 9, scope: !48)
!87 = !DILocation(line: 54, column: 21, scope: !48)
!88 = !DILocation(line: 55, column: 20, scope: !48)
!89 = !DILocation(line: 55, column: 9, scope: !48)
!90 = !DILocation(line: 57, column: 1, scope: !15)
!91 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_12_good", scope: !16, file: !16, line: 101, type: !17, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocation(line: 103, column: 5, scope: !91)
!93 = !DILocation(line: 104, column: 1, scope: !91)
!94 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 116, type: !95, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DISubroutineType(types: !96)
!96 = !{!7, !7, !97}
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!100 = !DILocalVariable(name: "argc", arg: 1, scope: !94, file: !16, line: 116, type: !7)
!101 = !DILocation(line: 116, column: 14, scope: !94)
!102 = !DILocalVariable(name: "argv", arg: 2, scope: !94, file: !16, line: 116, type: !97)
!103 = !DILocation(line: 116, column: 27, scope: !94)
!104 = !DILocation(line: 119, column: 22, scope: !94)
!105 = !DILocation(line: 119, column: 12, scope: !94)
!106 = !DILocation(line: 119, column: 5, scope: !94)
!107 = !DILocation(line: 121, column: 5, scope: !94)
!108 = !DILocation(line: 122, column: 5, scope: !94)
!109 = !DILocation(line: 123, column: 5, scope: !94)
!110 = !DILocation(line: 126, column: 5, scope: !94)
!111 = !DILocation(line: 127, column: 5, scope: !94)
!112 = !DILocation(line: 128, column: 5, scope: !94)
!113 = !DILocation(line: 130, column: 5, scope: !94)
!114 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 65, type: !17, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!115 = !DILocalVariable(name: "data", scope: !114, file: !16, line: 67, type: !4)
!116 = !DILocation(line: 67, column: 15, scope: !114)
!117 = !DILocalVariable(name: "dataBadBuffer", scope: !114, file: !16, line: 68, type: !4)
!118 = !DILocation(line: 68, column: 15, scope: !114)
!119 = !DILocation(line: 68, column: 42, scope: !114)
!120 = !DILocation(line: 68, column: 31, scope: !114)
!121 = !DILocalVariable(name: "dataGoodBuffer", scope: !114, file: !16, line: 69, type: !4)
!122 = !DILocation(line: 69, column: 15, scope: !114)
!123 = !DILocation(line: 69, column: 43, scope: !114)
!124 = !DILocation(line: 69, column: 32, scope: !114)
!125 = !DILocation(line: 70, column: 13, scope: !114)
!126 = !DILocation(line: 70, column: 5, scope: !114)
!127 = !DILocation(line: 71, column: 5, scope: !114)
!128 = !DILocation(line: 71, column: 25, scope: !114)
!129 = !DILocation(line: 72, column: 13, scope: !114)
!130 = !DILocation(line: 72, column: 5, scope: !114)
!131 = !DILocation(line: 73, column: 5, scope: !114)
!132 = !DILocation(line: 73, column: 27, scope: !114)
!133 = !DILocation(line: 74, column: 8, scope: !134)
!134 = distinct !DILexicalBlock(scope: !114, file: !16, line: 74, column: 8)
!135 = !DILocation(line: 74, column: 8, scope: !114)
!136 = !DILocation(line: 77, column: 16, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !16, line: 75, column: 5)
!138 = !DILocation(line: 77, column: 14, scope: !137)
!139 = !DILocation(line: 78, column: 5, scope: !137)
!140 = !DILocation(line: 82, column: 16, scope: !141)
!141 = distinct !DILexicalBlock(scope: !134, file: !16, line: 80, column: 5)
!142 = !DILocation(line: 82, column: 14, scope: !141)
!143 = !DILocalVariable(name: "i", scope: !144, file: !16, line: 85, type: !49)
!144 = distinct !DILexicalBlock(scope: !114, file: !16, line: 84, column: 5)
!145 = !DILocation(line: 85, column: 16, scope: !144)
!146 = !DILocalVariable(name: "destLen", scope: !144, file: !16, line: 85, type: !49)
!147 = !DILocation(line: 85, column: 19, scope: !144)
!148 = !DILocalVariable(name: "dest", scope: !144, file: !16, line: 86, type: !55)
!149 = !DILocation(line: 86, column: 17, scope: !144)
!150 = !DILocation(line: 87, column: 17, scope: !144)
!151 = !DILocation(line: 87, column: 9, scope: !144)
!152 = !DILocation(line: 88, column: 9, scope: !144)
!153 = !DILocation(line: 88, column: 21, scope: !144)
!154 = !DILocation(line: 89, column: 26, scope: !144)
!155 = !DILocation(line: 89, column: 19, scope: !144)
!156 = !DILocation(line: 89, column: 17, scope: !144)
!157 = !DILocation(line: 92, column: 16, scope: !158)
!158 = distinct !DILexicalBlock(scope: !144, file: !16, line: 92, column: 9)
!159 = !DILocation(line: 92, column: 14, scope: !158)
!160 = !DILocation(line: 92, column: 21, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !16, line: 92, column: 9)
!162 = !DILocation(line: 92, column: 25, scope: !161)
!163 = !DILocation(line: 92, column: 23, scope: !161)
!164 = !DILocation(line: 92, column: 9, scope: !158)
!165 = !DILocation(line: 94, column: 23, scope: !166)
!166 = distinct !DILexicalBlock(scope: !161, file: !16, line: 93, column: 9)
!167 = !DILocation(line: 94, column: 28, scope: !166)
!168 = !DILocation(line: 94, column: 18, scope: !166)
!169 = !DILocation(line: 94, column: 13, scope: !166)
!170 = !DILocation(line: 94, column: 21, scope: !166)
!171 = !DILocation(line: 95, column: 9, scope: !166)
!172 = !DILocation(line: 92, column: 35, scope: !161)
!173 = !DILocation(line: 92, column: 9, scope: !161)
!174 = distinct !{!174, !164, !175, !85}
!175 = !DILocation(line: 95, column: 9, scope: !158)
!176 = !DILocation(line: 96, column: 9, scope: !144)
!177 = !DILocation(line: 96, column: 21, scope: !144)
!178 = !DILocation(line: 97, column: 20, scope: !144)
!179 = !DILocation(line: 97, column: 9, scope: !144)
!180 = !DILocation(line: 99, column: 1, scope: !114)
