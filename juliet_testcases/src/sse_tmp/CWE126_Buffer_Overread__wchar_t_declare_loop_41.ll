; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_41.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_41_badSink(i32* %data) #0 !dbg !11 {
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
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_41_bad() #0 !dbg !65 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !70, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !77
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #5, !dbg !78
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !79
  store i32 0, i32* %arrayidx, align 4, !dbg !80
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !81
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #5, !dbg !82
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !83
  store i32 0, i32* %arrayidx3, align 4, !dbg !84
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !85
  store i32* %arraydecay4, i32** %data, align 8, !dbg !86
  %0 = load i32*, i32** %data, align 8, !dbg !87
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_41_badSink(i32* %0), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_41_goodG2BSink(i32* %data) #0 !dbg !90 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata i64* %i, metadata !93, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !98, metadata !DIExpression()), !dbg !99
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !100
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !101
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !102
  store i32 0, i32* %arrayidx, align 4, !dbg !103
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !104
  %call2 = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !105
  store i64 %call2, i64* %destLen, align 8, !dbg !106
  store i64 0, i64* %i, align 8, !dbg !107
  br label %for.cond, !dbg !109

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !110
  %1 = load i64, i64* %destLen, align 8, !dbg !112
  %cmp = icmp ult i64 %0, %1, !dbg !113
  br i1 %cmp, label %for.body, label %for.end, !dbg !114

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data.addr, align 8, !dbg !115
  %3 = load i64, i64* %i, align 8, !dbg !117
  %arrayidx3 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !115
  %4 = load i32, i32* %arrayidx3, align 4, !dbg !115
  %5 = load i64, i64* %i, align 8, !dbg !118
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !119
  store i32 %4, i32* %arrayidx4, align 4, !dbg !120
  br label %for.inc, !dbg !121

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !122
  %inc = add i64 %6, 1, !dbg !122
  store i64 %inc, i64* %i, align 8, !dbg !122
  br label %for.cond, !dbg !123, !llvm.loop !124

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !126
  store i32 0, i32* %arrayidx5, align 4, !dbg !127
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !128
  call void @printWLine(i32* %arraydecay6), !dbg !129
  ret void, !dbg !130
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_41_good() #0 !dbg !131 {
entry:
  call void @goodG2B(), !dbg !132
  ret void, !dbg !133
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !134 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !140, metadata !DIExpression()), !dbg !141
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !142, metadata !DIExpression()), !dbg !143
  %call = call i64 @time(i64* null) #5, !dbg !144
  %conv = trunc i64 %call to i32, !dbg !145
  call void @srand(i32 %conv) #5, !dbg !146
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !147
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_41_good(), !dbg !148
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !149
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !150
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_41_bad(), !dbg !151
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !152
  ret i32 0, !dbg !153
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !154 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !155, metadata !DIExpression()), !dbg !156
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !157, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !159, metadata !DIExpression()), !dbg !160
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !161
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #5, !dbg !162
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !163
  store i32 0, i32* %arrayidx, align 4, !dbg !164
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !165
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #5, !dbg !166
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !167
  store i32 0, i32* %arrayidx3, align 4, !dbg !168
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !169
  store i32* %arraydecay4, i32** %data, align 8, !dbg !170
  %0 = load i32*, i32** %data, align 8, !dbg !171
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_41_goodG2BSink(i32* %0), !dbg !172
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_41_badSink", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !17, line: 74, baseType: !18)
!17 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 23, type: !15)
!20 = !DILocation(line: 23, column: 72, scope: !11)
!21 = !DILocalVariable(name: "i", scope: !22, file: !12, line: 26, type: !23)
!22 = distinct !DILexicalBlock(scope: !11, file: !12, line: 25, column: 5)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !17, line: 46, baseType: !24)
!24 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!25 = !DILocation(line: 26, column: 16, scope: !22)
!26 = !DILocalVariable(name: "destLen", scope: !22, file: !12, line: 26, type: !23)
!27 = !DILocation(line: 26, column: 19, scope: !22)
!28 = !DILocalVariable(name: "dest", scope: !22, file: !12, line: 27, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 3200, elements: !30)
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
!41 = distinct !DILexicalBlock(scope: !22, file: !12, line: 33, column: 9)
!42 = !DILocation(line: 33, column: 14, scope: !41)
!43 = !DILocation(line: 33, column: 21, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !12, line: 33, column: 9)
!45 = !DILocation(line: 33, column: 25, scope: !44)
!46 = !DILocation(line: 33, column: 23, scope: !44)
!47 = !DILocation(line: 33, column: 9, scope: !41)
!48 = !DILocation(line: 35, column: 23, scope: !49)
!49 = distinct !DILexicalBlock(scope: !44, file: !12, line: 34, column: 9)
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
!64 = !DILocation(line: 40, column: 1, scope: !11)
!65 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_41_bad", scope: !12, file: !12, line: 42, type: !66, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{null}
!68 = !DILocalVariable(name: "data", scope: !65, file: !12, line: 44, type: !15)
!69 = !DILocation(line: 44, column: 15, scope: !65)
!70 = !DILocalVariable(name: "dataBadBuffer", scope: !65, file: !12, line: 45, type: !71)
!71 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 1600, elements: !72)
!72 = !{!73}
!73 = !DISubrange(count: 50)
!74 = !DILocation(line: 45, column: 13, scope: !65)
!75 = !DILocalVariable(name: "dataGoodBuffer", scope: !65, file: !12, line: 46, type: !29)
!76 = !DILocation(line: 46, column: 13, scope: !65)
!77 = !DILocation(line: 47, column: 13, scope: !65)
!78 = !DILocation(line: 47, column: 5, scope: !65)
!79 = !DILocation(line: 48, column: 5, scope: !65)
!80 = !DILocation(line: 48, column: 25, scope: !65)
!81 = !DILocation(line: 49, column: 13, scope: !65)
!82 = !DILocation(line: 49, column: 5, scope: !65)
!83 = !DILocation(line: 50, column: 5, scope: !65)
!84 = !DILocation(line: 50, column: 27, scope: !65)
!85 = !DILocation(line: 52, column: 12, scope: !65)
!86 = !DILocation(line: 52, column: 10, scope: !65)
!87 = !DILocation(line: 53, column: 61, scope: !65)
!88 = !DILocation(line: 53, column: 5, scope: !65)
!89 = !DILocation(line: 54, column: 1, scope: !65)
!90 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_41_goodG2BSink", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocalVariable(name: "data", arg: 1, scope: !90, file: !12, line: 60, type: !15)
!92 = !DILocation(line: 60, column: 76, scope: !90)
!93 = !DILocalVariable(name: "i", scope: !94, file: !12, line: 63, type: !23)
!94 = distinct !DILexicalBlock(scope: !90, file: !12, line: 62, column: 5)
!95 = !DILocation(line: 63, column: 16, scope: !94)
!96 = !DILocalVariable(name: "destLen", scope: !94, file: !12, line: 63, type: !23)
!97 = !DILocation(line: 63, column: 19, scope: !94)
!98 = !DILocalVariable(name: "dest", scope: !94, file: !12, line: 64, type: !29)
!99 = !DILocation(line: 64, column: 17, scope: !94)
!100 = !DILocation(line: 65, column: 17, scope: !94)
!101 = !DILocation(line: 65, column: 9, scope: !94)
!102 = !DILocation(line: 66, column: 9, scope: !94)
!103 = !DILocation(line: 66, column: 21, scope: !94)
!104 = !DILocation(line: 67, column: 26, scope: !94)
!105 = !DILocation(line: 67, column: 19, scope: !94)
!106 = !DILocation(line: 67, column: 17, scope: !94)
!107 = !DILocation(line: 70, column: 16, scope: !108)
!108 = distinct !DILexicalBlock(scope: !94, file: !12, line: 70, column: 9)
!109 = !DILocation(line: 70, column: 14, scope: !108)
!110 = !DILocation(line: 70, column: 21, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !12, line: 70, column: 9)
!112 = !DILocation(line: 70, column: 25, scope: !111)
!113 = !DILocation(line: 70, column: 23, scope: !111)
!114 = !DILocation(line: 70, column: 9, scope: !108)
!115 = !DILocation(line: 72, column: 23, scope: !116)
!116 = distinct !DILexicalBlock(scope: !111, file: !12, line: 71, column: 9)
!117 = !DILocation(line: 72, column: 28, scope: !116)
!118 = !DILocation(line: 72, column: 18, scope: !116)
!119 = !DILocation(line: 72, column: 13, scope: !116)
!120 = !DILocation(line: 72, column: 21, scope: !116)
!121 = !DILocation(line: 73, column: 9, scope: !116)
!122 = !DILocation(line: 70, column: 35, scope: !111)
!123 = !DILocation(line: 70, column: 9, scope: !111)
!124 = distinct !{!124, !114, !125, !59}
!125 = !DILocation(line: 73, column: 9, scope: !108)
!126 = !DILocation(line: 74, column: 9, scope: !94)
!127 = !DILocation(line: 74, column: 21, scope: !94)
!128 = !DILocation(line: 75, column: 20, scope: !94)
!129 = !DILocation(line: 75, column: 9, scope: !94)
!130 = !DILocation(line: 77, column: 1, scope: !90)
!131 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_41_good", scope: !12, file: !12, line: 94, type: !66, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!132 = !DILocation(line: 96, column: 5, scope: !131)
!133 = !DILocation(line: 97, column: 1, scope: !131)
!134 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 109, type: !135, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!135 = !DISubroutineType(types: !136)
!136 = !{!18, !18, !137}
!137 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !138, size: 64)
!138 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !139, size: 64)
!139 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!140 = !DILocalVariable(name: "argc", arg: 1, scope: !134, file: !12, line: 109, type: !18)
!141 = !DILocation(line: 109, column: 14, scope: !134)
!142 = !DILocalVariable(name: "argv", arg: 2, scope: !134, file: !12, line: 109, type: !137)
!143 = !DILocation(line: 109, column: 27, scope: !134)
!144 = !DILocation(line: 112, column: 22, scope: !134)
!145 = !DILocation(line: 112, column: 12, scope: !134)
!146 = !DILocation(line: 112, column: 5, scope: !134)
!147 = !DILocation(line: 114, column: 5, scope: !134)
!148 = !DILocation(line: 115, column: 5, scope: !134)
!149 = !DILocation(line: 116, column: 5, scope: !134)
!150 = !DILocation(line: 119, column: 5, scope: !134)
!151 = !DILocation(line: 120, column: 5, scope: !134)
!152 = !DILocation(line: 121, column: 5, scope: !134)
!153 = !DILocation(line: 123, column: 5, scope: !134)
!154 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 80, type: !66, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!155 = !DILocalVariable(name: "data", scope: !154, file: !12, line: 82, type: !15)
!156 = !DILocation(line: 82, column: 15, scope: !154)
!157 = !DILocalVariable(name: "dataBadBuffer", scope: !154, file: !12, line: 83, type: !71)
!158 = !DILocation(line: 83, column: 13, scope: !154)
!159 = !DILocalVariable(name: "dataGoodBuffer", scope: !154, file: !12, line: 84, type: !29)
!160 = !DILocation(line: 84, column: 13, scope: !154)
!161 = !DILocation(line: 85, column: 13, scope: !154)
!162 = !DILocation(line: 85, column: 5, scope: !154)
!163 = !DILocation(line: 86, column: 5, scope: !154)
!164 = !DILocation(line: 86, column: 25, scope: !154)
!165 = !DILocation(line: 87, column: 13, scope: !154)
!166 = !DILocation(line: 87, column: 5, scope: !154)
!167 = !DILocation(line: 88, column: 5, scope: !154)
!168 = !DILocation(line: 88, column: 27, scope: !154)
!169 = !DILocation(line: 90, column: 12, scope: !154)
!170 = !DILocation(line: 90, column: 10, scope: !154)
!171 = !DILocation(line: 91, column: 65, scope: !154)
!172 = !DILocation(line: 91, column: 5, scope: !154)
!173 = !DILocation(line: 92, column: 1, scope: !154)
