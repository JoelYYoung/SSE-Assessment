; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_41.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_41_badSink(i32* %data) #0 !dbg !15 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i64* %i, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !28, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !33
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !34
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !37
  %call2 = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !38
  store i64 %call2, i64* %destLen, align 8, !dbg !39
  store i64 0, i64* %i, align 8, !dbg !40
  br label %for.cond, !dbg !42

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !43
  %1 = load i64, i64* %destLen, align 8, !dbg !45
  %cmp = icmp ult i64 %0, %1, !dbg !46
  br i1 %cmp, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data.addr, align 8, !dbg !48
  %3 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx3 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !48
  %4 = load i32, i32* %arrayidx3, align 4, !dbg !48
  %5 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !52
  store i32 %4, i32* %arrayidx4, align 4, !dbg !53
  br label %for.inc, !dbg !54

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !55
  %inc = add i64 %6, 1, !dbg !55
  store i64 %inc, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !56, !llvm.loop !57

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !60
  store i32 0, i32* %arrayidx5, align 4, !dbg !61
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !62
  call void @printWLine(i32* %arraydecay6), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_41_bad() #0 !dbg !65 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !70, metadata !DIExpression()), !dbg !71
  %0 = alloca i8, i64 200, align 16, !dbg !72
  %1 = bitcast i8* %0 to i32*, !dbg !73
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !71
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  %2 = alloca i8, i64 400, align 16, !dbg !76
  %3 = bitcast i8* %2 to i32*, !dbg !77
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !75
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !78
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !79
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !80
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !80
  store i32 0, i32* %arrayidx, align 4, !dbg !81
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !82
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #5, !dbg !83
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !84
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !84
  store i32 0, i32* %arrayidx2, align 4, !dbg !85
  %8 = load i32*, i32** %dataBadBuffer, align 8, !dbg !86
  store i32* %8, i32** %data, align 8, !dbg !87
  %9 = load i32*, i32** %data, align 8, !dbg !88
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_41_badSink(i32* %9), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_41_goodG2BSink(i32* %data) #0 !dbg !91 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata i64* %i, metadata !94, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !99, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !101
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !102
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !103
  store i32 0, i32* %arrayidx, align 4, !dbg !104
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !105
  %call2 = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !106
  store i64 %call2, i64* %destLen, align 8, !dbg !107
  store i64 0, i64* %i, align 8, !dbg !108
  br label %for.cond, !dbg !110

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !111
  %1 = load i64, i64* %destLen, align 8, !dbg !113
  %cmp = icmp ult i64 %0, %1, !dbg !114
  br i1 %cmp, label %for.body, label %for.end, !dbg !115

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data.addr, align 8, !dbg !116
  %3 = load i64, i64* %i, align 8, !dbg !118
  %arrayidx3 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !116
  %4 = load i32, i32* %arrayidx3, align 4, !dbg !116
  %5 = load i64, i64* %i, align 8, !dbg !119
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !120
  store i32 %4, i32* %arrayidx4, align 4, !dbg !121
  br label %for.inc, !dbg !122

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !123
  %inc = add i64 %6, 1, !dbg !123
  store i64 %inc, i64* %i, align 8, !dbg !123
  br label %for.cond, !dbg !124, !llvm.loop !125

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !127
  store i32 0, i32* %arrayidx5, align 4, !dbg !128
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !129
  call void @printWLine(i32* %arraydecay6), !dbg !130
  ret void, !dbg !131
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_41_good() #0 !dbg !132 {
entry:
  call void @goodG2B(), !dbg !133
  ret void, !dbg !134
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !135 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !141, metadata !DIExpression()), !dbg !142
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !143, metadata !DIExpression()), !dbg !144
  %call = call i64 @time(i64* null) #5, !dbg !145
  %conv = trunc i64 %call to i32, !dbg !146
  call void @srand(i32 %conv) #5, !dbg !147
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !148
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_41_good(), !dbg !149
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !150
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !151
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_41_bad(), !dbg !152
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !153
  ret i32 0, !dbg !154
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !155 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !156, metadata !DIExpression()), !dbg !157
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !158, metadata !DIExpression()), !dbg !159
  %0 = alloca i8, i64 200, align 16, !dbg !160
  %1 = bitcast i8* %0 to i32*, !dbg !161
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !159
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !162, metadata !DIExpression()), !dbg !163
  %2 = alloca i8, i64 400, align 16, !dbg !164
  %3 = bitcast i8* %2 to i32*, !dbg !165
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !163
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !166
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !167
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !168
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !168
  store i32 0, i32* %arrayidx, align 4, !dbg !169
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !170
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #5, !dbg !171
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !172
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !172
  store i32 0, i32* %arrayidx2, align 4, !dbg !173
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !174
  store i32* %8, i32** %data, align 8, !dbg !175
  %9 = load i32*, i32** %data, align 8, !dbg !176
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_41_goodG2BSink(i32* %9), !dbg !177
  ret void, !dbg !178
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_41_badSink", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null, !4}
!19 = !DILocalVariable(name: "data", arg: 1, scope: !15, file: !16, line: 23, type: !4)
!20 = !DILocation(line: 23, column: 71, scope: !15)
!21 = !DILocalVariable(name: "i", scope: !22, file: !16, line: 26, type: !23)
!22 = distinct !DILexicalBlock(scope: !15, file: !16, line: 25, column: 5)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !24)
!24 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!25 = !DILocation(line: 26, column: 16, scope: !22)
!26 = !DILocalVariable(name: "destLen", scope: !22, file: !16, line: 26, type: !23)
!27 = !DILocation(line: 26, column: 19, scope: !22)
!28 = !DILocalVariable(name: "dest", scope: !22, file: !16, line: 27, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 27, column: 17, scope: !22)
!33 = !DILocation(line: 28, column: 17, scope: !22)
!34 = !DILocation(line: 28, column: 9, scope: !22)
!35 = !DILocation(line: 29, column: 9, scope: !22)
!36 = !DILocation(line: 29, column: 21, scope: !22)
!37 = !DILocation(line: 30, column: 26, scope: !22)
!38 = !DILocation(line: 30, column: 19, scope: !22)
!39 = !DILocation(line: 30, column: 17, scope: !22)
!40 = !DILocation(line: 33, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !22, file: !16, line: 33, column: 9)
!42 = !DILocation(line: 33, column: 14, scope: !41)
!43 = !DILocation(line: 33, column: 21, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !16, line: 33, column: 9)
!45 = !DILocation(line: 33, column: 25, scope: !44)
!46 = !DILocation(line: 33, column: 23, scope: !44)
!47 = !DILocation(line: 33, column: 9, scope: !41)
!48 = !DILocation(line: 35, column: 23, scope: !49)
!49 = distinct !DILexicalBlock(scope: !44, file: !16, line: 34, column: 9)
!50 = !DILocation(line: 35, column: 28, scope: !49)
!51 = !DILocation(line: 35, column: 18, scope: !49)
!52 = !DILocation(line: 35, column: 13, scope: !49)
!53 = !DILocation(line: 35, column: 21, scope: !49)
!54 = !DILocation(line: 36, column: 9, scope: !49)
!55 = !DILocation(line: 33, column: 35, scope: !44)
!56 = !DILocation(line: 33, column: 9, scope: !44)
!57 = distinct !{!57, !47, !58, !59}
!58 = !DILocation(line: 36, column: 9, scope: !41)
!59 = !{!"llvm.loop.mustprogress"}
!60 = !DILocation(line: 37, column: 9, scope: !22)
!61 = !DILocation(line: 37, column: 21, scope: !22)
!62 = !DILocation(line: 38, column: 20, scope: !22)
!63 = !DILocation(line: 38, column: 9, scope: !22)
!64 = !DILocation(line: 40, column: 1, scope: !15)
!65 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_41_bad", scope: !16, file: !16, line: 42, type: !66, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{null}
!68 = !DILocalVariable(name: "data", scope: !65, file: !16, line: 44, type: !4)
!69 = !DILocation(line: 44, column: 15, scope: !65)
!70 = !DILocalVariable(name: "dataBadBuffer", scope: !65, file: !16, line: 45, type: !4)
!71 = !DILocation(line: 45, column: 15, scope: !65)
!72 = !DILocation(line: 45, column: 42, scope: !65)
!73 = !DILocation(line: 45, column: 31, scope: !65)
!74 = !DILocalVariable(name: "dataGoodBuffer", scope: !65, file: !16, line: 46, type: !4)
!75 = !DILocation(line: 46, column: 15, scope: !65)
!76 = !DILocation(line: 46, column: 43, scope: !65)
!77 = !DILocation(line: 46, column: 32, scope: !65)
!78 = !DILocation(line: 47, column: 13, scope: !65)
!79 = !DILocation(line: 47, column: 5, scope: !65)
!80 = !DILocation(line: 48, column: 5, scope: !65)
!81 = !DILocation(line: 48, column: 25, scope: !65)
!82 = !DILocation(line: 49, column: 13, scope: !65)
!83 = !DILocation(line: 49, column: 5, scope: !65)
!84 = !DILocation(line: 50, column: 5, scope: !65)
!85 = !DILocation(line: 50, column: 27, scope: !65)
!86 = !DILocation(line: 52, column: 12, scope: !65)
!87 = !DILocation(line: 52, column: 10, scope: !65)
!88 = !DILocation(line: 53, column: 60, scope: !65)
!89 = !DILocation(line: 53, column: 5, scope: !65)
!90 = !DILocation(line: 54, column: 1, scope: !65)
!91 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_41_goodG2BSink", scope: !16, file: !16, line: 60, type: !17, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocalVariable(name: "data", arg: 1, scope: !91, file: !16, line: 60, type: !4)
!93 = !DILocation(line: 60, column: 75, scope: !91)
!94 = !DILocalVariable(name: "i", scope: !95, file: !16, line: 63, type: !23)
!95 = distinct !DILexicalBlock(scope: !91, file: !16, line: 62, column: 5)
!96 = !DILocation(line: 63, column: 16, scope: !95)
!97 = !DILocalVariable(name: "destLen", scope: !95, file: !16, line: 63, type: !23)
!98 = !DILocation(line: 63, column: 19, scope: !95)
!99 = !DILocalVariable(name: "dest", scope: !95, file: !16, line: 64, type: !29)
!100 = !DILocation(line: 64, column: 17, scope: !95)
!101 = !DILocation(line: 65, column: 17, scope: !95)
!102 = !DILocation(line: 65, column: 9, scope: !95)
!103 = !DILocation(line: 66, column: 9, scope: !95)
!104 = !DILocation(line: 66, column: 21, scope: !95)
!105 = !DILocation(line: 67, column: 26, scope: !95)
!106 = !DILocation(line: 67, column: 19, scope: !95)
!107 = !DILocation(line: 67, column: 17, scope: !95)
!108 = !DILocation(line: 70, column: 16, scope: !109)
!109 = distinct !DILexicalBlock(scope: !95, file: !16, line: 70, column: 9)
!110 = !DILocation(line: 70, column: 14, scope: !109)
!111 = !DILocation(line: 70, column: 21, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !16, line: 70, column: 9)
!113 = !DILocation(line: 70, column: 25, scope: !112)
!114 = !DILocation(line: 70, column: 23, scope: !112)
!115 = !DILocation(line: 70, column: 9, scope: !109)
!116 = !DILocation(line: 72, column: 23, scope: !117)
!117 = distinct !DILexicalBlock(scope: !112, file: !16, line: 71, column: 9)
!118 = !DILocation(line: 72, column: 28, scope: !117)
!119 = !DILocation(line: 72, column: 18, scope: !117)
!120 = !DILocation(line: 72, column: 13, scope: !117)
!121 = !DILocation(line: 72, column: 21, scope: !117)
!122 = !DILocation(line: 73, column: 9, scope: !117)
!123 = !DILocation(line: 70, column: 35, scope: !112)
!124 = !DILocation(line: 70, column: 9, scope: !112)
!125 = distinct !{!125, !115, !126, !59}
!126 = !DILocation(line: 73, column: 9, scope: !109)
!127 = !DILocation(line: 74, column: 9, scope: !95)
!128 = !DILocation(line: 74, column: 21, scope: !95)
!129 = !DILocation(line: 75, column: 20, scope: !95)
!130 = !DILocation(line: 75, column: 9, scope: !95)
!131 = !DILocation(line: 77, column: 1, scope: !91)
!132 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_41_good", scope: !16, file: !16, line: 94, type: !66, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!133 = !DILocation(line: 96, column: 5, scope: !132)
!134 = !DILocation(line: 97, column: 1, scope: !132)
!135 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 109, type: !136, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!136 = !DISubroutineType(types: !137)
!137 = !{!7, !7, !138}
!138 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !139, size: 64)
!139 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !140, size: 64)
!140 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!141 = !DILocalVariable(name: "argc", arg: 1, scope: !135, file: !16, line: 109, type: !7)
!142 = !DILocation(line: 109, column: 14, scope: !135)
!143 = !DILocalVariable(name: "argv", arg: 2, scope: !135, file: !16, line: 109, type: !138)
!144 = !DILocation(line: 109, column: 27, scope: !135)
!145 = !DILocation(line: 112, column: 22, scope: !135)
!146 = !DILocation(line: 112, column: 12, scope: !135)
!147 = !DILocation(line: 112, column: 5, scope: !135)
!148 = !DILocation(line: 114, column: 5, scope: !135)
!149 = !DILocation(line: 115, column: 5, scope: !135)
!150 = !DILocation(line: 116, column: 5, scope: !135)
!151 = !DILocation(line: 119, column: 5, scope: !135)
!152 = !DILocation(line: 120, column: 5, scope: !135)
!153 = !DILocation(line: 121, column: 5, scope: !135)
!154 = !DILocation(line: 123, column: 5, scope: !135)
!155 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 80, type: !66, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!156 = !DILocalVariable(name: "data", scope: !155, file: !16, line: 82, type: !4)
!157 = !DILocation(line: 82, column: 15, scope: !155)
!158 = !DILocalVariable(name: "dataBadBuffer", scope: !155, file: !16, line: 83, type: !4)
!159 = !DILocation(line: 83, column: 15, scope: !155)
!160 = !DILocation(line: 83, column: 42, scope: !155)
!161 = !DILocation(line: 83, column: 31, scope: !155)
!162 = !DILocalVariable(name: "dataGoodBuffer", scope: !155, file: !16, line: 84, type: !4)
!163 = !DILocation(line: 84, column: 15, scope: !155)
!164 = !DILocation(line: 84, column: 43, scope: !155)
!165 = !DILocation(line: 84, column: 32, scope: !155)
!166 = !DILocation(line: 85, column: 13, scope: !155)
!167 = !DILocation(line: 85, column: 5, scope: !155)
!168 = !DILocation(line: 86, column: 5, scope: !155)
!169 = !DILocation(line: 86, column: 25, scope: !155)
!170 = !DILocation(line: 87, column: 13, scope: !155)
!171 = !DILocation(line: 87, column: 5, scope: !155)
!172 = !DILocation(line: 88, column: 5, scope: !155)
!173 = !DILocation(line: 88, column: 27, scope: !155)
!174 = !DILocation(line: 90, column: 12, scope: !155)
!175 = !DILocation(line: 90, column: 10, scope: !155)
!176 = !DILocation(line: 91, column: 64, scope: !155)
!177 = !DILocation(line: 91, column: 5, scope: !155)
!178 = !DILocation(line: 92, column: 1, scope: !155)
