; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_41_badSink(i32* %data) #0 !dbg !15 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i64* %i, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !31
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !32
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  store i64 0, i64* %i, align 8, !dbg !35
  br label %for.cond, !dbg !37

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !38
  %cmp = icmp ult i64 %0, 100, !dbg !40
  br i1 %cmp, label %for.body, label %for.end, !dbg !41

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !42
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %1, !dbg !44
  %2 = load i32, i32* %arrayidx1, align 4, !dbg !44
  %3 = load i32*, i32** %data.addr, align 8, !dbg !45
  %4 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx2 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !45
  store i32 %2, i32* %arrayidx2, align 4, !dbg !47
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !49
  %inc = add i64 %5, 1, !dbg !49
  store i64 %inc, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %data.addr, align 8, !dbg !54
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !54
  store i32 0, i32* %arrayidx3, align 4, !dbg !55
  %7 = load i32*, i32** %data.addr, align 8, !dbg !56
  call void @printWLine(i32* %7), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_41_bad() #0 !dbg !59 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !64, metadata !DIExpression()), !dbg !65
  %0 = alloca i8, i64 200, align 16, !dbg !66
  %1 = bitcast i8* %0 to i32*, !dbg !67
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !68, metadata !DIExpression()), !dbg !69
  %2 = alloca i8, i64 400, align 16, !dbg !70
  %3 = bitcast i8* %2 to i32*, !dbg !71
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !69
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !72
  store i32* %4, i32** %data, align 8, !dbg !73
  %5 = load i32*, i32** %data, align 8, !dbg !74
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !74
  store i32 0, i32* %arrayidx, align 4, !dbg !75
  %6 = load i32*, i32** %data, align 8, !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_41_badSink(i32* %6), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_41_goodG2BSink(i32* %data) #0 !dbg !79 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata i64* %i, metadata !82, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !85, metadata !DIExpression()), !dbg !86
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !87
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !88
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !89
  store i32 0, i32* %arrayidx, align 4, !dbg !90
  store i64 0, i64* %i, align 8, !dbg !91
  br label %for.cond, !dbg !93

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !94
  %cmp = icmp ult i64 %0, 100, !dbg !96
  br i1 %cmp, label %for.body, label %for.end, !dbg !97

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !98
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %1, !dbg !100
  %2 = load i32, i32* %arrayidx1, align 4, !dbg !100
  %3 = load i32*, i32** %data.addr, align 8, !dbg !101
  %4 = load i64, i64* %i, align 8, !dbg !102
  %arrayidx2 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !101
  store i32 %2, i32* %arrayidx2, align 4, !dbg !103
  br label %for.inc, !dbg !104

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !105
  %inc = add i64 %5, 1, !dbg !105
  store i64 %inc, i64* %i, align 8, !dbg !105
  br label %for.cond, !dbg !106, !llvm.loop !107

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %data.addr, align 8, !dbg !109
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !109
  store i32 0, i32* %arrayidx3, align 4, !dbg !110
  %7 = load i32*, i32** %data.addr, align 8, !dbg !111
  call void @printWLine(i32* %7), !dbg !112
  ret void, !dbg !113
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_41_good() #0 !dbg !114 {
entry:
  call void @goodG2B(), !dbg !115
  ret void, !dbg !116
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !117 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !123, metadata !DIExpression()), !dbg !124
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !125, metadata !DIExpression()), !dbg !126
  %call = call i64 @time(i64* null) #4, !dbg !127
  %conv = trunc i64 %call to i32, !dbg !128
  call void @srand(i32 %conv) #4, !dbg !129
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !130
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_41_good(), !dbg !131
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !132
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !133
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_41_bad(), !dbg !134
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !135
  ret i32 0, !dbg !136
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !137 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !138, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !140, metadata !DIExpression()), !dbg !141
  %0 = alloca i8, i64 200, align 16, !dbg !142
  %1 = bitcast i8* %0 to i32*, !dbg !143
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !141
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !144, metadata !DIExpression()), !dbg !145
  %2 = alloca i8, i64 400, align 16, !dbg !146
  %3 = bitcast i8* %2 to i32*, !dbg !147
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !145
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !148
  store i32* %4, i32** %data, align 8, !dbg !149
  %5 = load i32*, i32** %data, align 8, !dbg !150
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !150
  store i32 0, i32* %arrayidx, align 4, !dbg !151
  %6 = load i32*, i32** %data, align 8, !dbg !152
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_41_goodG2BSink(i32* %6), !dbg !153
  ret void, !dbg !154
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_41.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_41_badSink", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_41.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null, !4}
!19 = !DILocalVariable(name: "data", arg: 1, scope: !15, file: !16, line: 23, type: !4)
!20 = !DILocation(line: 23, column: 90, scope: !15)
!21 = !DILocalVariable(name: "i", scope: !22, file: !16, line: 26, type: !23)
!22 = distinct !DILexicalBlock(scope: !15, file: !16, line: 25, column: 5)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !24)
!24 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!25 = !DILocation(line: 26, column: 16, scope: !22)
!26 = !DILocalVariable(name: "source", scope: !22, file: !16, line: 27, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 27, column: 17, scope: !22)
!31 = !DILocation(line: 28, column: 17, scope: !22)
!32 = !DILocation(line: 28, column: 9, scope: !22)
!33 = !DILocation(line: 29, column: 9, scope: !22)
!34 = !DILocation(line: 29, column: 23, scope: !22)
!35 = !DILocation(line: 31, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !22, file: !16, line: 31, column: 9)
!37 = !DILocation(line: 31, column: 14, scope: !36)
!38 = !DILocation(line: 31, column: 21, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !16, line: 31, column: 9)
!40 = !DILocation(line: 31, column: 23, scope: !39)
!41 = !DILocation(line: 31, column: 9, scope: !36)
!42 = !DILocation(line: 33, column: 30, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !16, line: 32, column: 9)
!44 = !DILocation(line: 33, column: 23, scope: !43)
!45 = !DILocation(line: 33, column: 13, scope: !43)
!46 = !DILocation(line: 33, column: 18, scope: !43)
!47 = !DILocation(line: 33, column: 21, scope: !43)
!48 = !DILocation(line: 34, column: 9, scope: !43)
!49 = !DILocation(line: 31, column: 31, scope: !39)
!50 = !DILocation(line: 31, column: 9, scope: !39)
!51 = distinct !{!51, !41, !52, !53}
!52 = !DILocation(line: 34, column: 9, scope: !36)
!53 = !{!"llvm.loop.mustprogress"}
!54 = !DILocation(line: 35, column: 9, scope: !22)
!55 = !DILocation(line: 35, column: 21, scope: !22)
!56 = !DILocation(line: 36, column: 20, scope: !22)
!57 = !DILocation(line: 36, column: 9, scope: !22)
!58 = !DILocation(line: 38, column: 1, scope: !15)
!59 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_41_bad", scope: !16, file: !16, line: 40, type: !60, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{null}
!62 = !DILocalVariable(name: "data", scope: !59, file: !16, line: 42, type: !4)
!63 = !DILocation(line: 42, column: 15, scope: !59)
!64 = !DILocalVariable(name: "dataBadBuffer", scope: !59, file: !16, line: 43, type: !4)
!65 = !DILocation(line: 43, column: 15, scope: !59)
!66 = !DILocation(line: 43, column: 42, scope: !59)
!67 = !DILocation(line: 43, column: 31, scope: !59)
!68 = !DILocalVariable(name: "dataGoodBuffer", scope: !59, file: !16, line: 44, type: !4)
!69 = !DILocation(line: 44, column: 15, scope: !59)
!70 = !DILocation(line: 44, column: 43, scope: !59)
!71 = !DILocation(line: 44, column: 32, scope: !59)
!72 = !DILocation(line: 47, column: 12, scope: !59)
!73 = !DILocation(line: 47, column: 10, scope: !59)
!74 = !DILocation(line: 48, column: 5, scope: !59)
!75 = !DILocation(line: 48, column: 13, scope: !59)
!76 = !DILocation(line: 49, column: 79, scope: !59)
!77 = !DILocation(line: 49, column: 5, scope: !59)
!78 = !DILocation(line: 50, column: 1, scope: !59)
!79 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_41_goodG2BSink", scope: !16, file: !16, line: 56, type: !17, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", arg: 1, scope: !79, file: !16, line: 56, type: !4)
!81 = !DILocation(line: 56, column: 94, scope: !79)
!82 = !DILocalVariable(name: "i", scope: !83, file: !16, line: 59, type: !23)
!83 = distinct !DILexicalBlock(scope: !79, file: !16, line: 58, column: 5)
!84 = !DILocation(line: 59, column: 16, scope: !83)
!85 = !DILocalVariable(name: "source", scope: !83, file: !16, line: 60, type: !27)
!86 = !DILocation(line: 60, column: 17, scope: !83)
!87 = !DILocation(line: 61, column: 17, scope: !83)
!88 = !DILocation(line: 61, column: 9, scope: !83)
!89 = !DILocation(line: 62, column: 9, scope: !83)
!90 = !DILocation(line: 62, column: 23, scope: !83)
!91 = !DILocation(line: 64, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !83, file: !16, line: 64, column: 9)
!93 = !DILocation(line: 64, column: 14, scope: !92)
!94 = !DILocation(line: 64, column: 21, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !16, line: 64, column: 9)
!96 = !DILocation(line: 64, column: 23, scope: !95)
!97 = !DILocation(line: 64, column: 9, scope: !92)
!98 = !DILocation(line: 66, column: 30, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !16, line: 65, column: 9)
!100 = !DILocation(line: 66, column: 23, scope: !99)
!101 = !DILocation(line: 66, column: 13, scope: !99)
!102 = !DILocation(line: 66, column: 18, scope: !99)
!103 = !DILocation(line: 66, column: 21, scope: !99)
!104 = !DILocation(line: 67, column: 9, scope: !99)
!105 = !DILocation(line: 64, column: 31, scope: !95)
!106 = !DILocation(line: 64, column: 9, scope: !95)
!107 = distinct !{!107, !97, !108, !53}
!108 = !DILocation(line: 67, column: 9, scope: !92)
!109 = !DILocation(line: 68, column: 9, scope: !83)
!110 = !DILocation(line: 68, column: 21, scope: !83)
!111 = !DILocation(line: 69, column: 20, scope: !83)
!112 = !DILocation(line: 69, column: 9, scope: !83)
!113 = !DILocation(line: 71, column: 1, scope: !79)
!114 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_41_good", scope: !16, file: !16, line: 85, type: !60, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!115 = !DILocation(line: 87, column: 5, scope: !114)
!116 = !DILocation(line: 88, column: 1, scope: !114)
!117 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 100, type: !118, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!118 = !DISubroutineType(types: !119)
!119 = !{!7, !7, !120}
!120 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !121, size: 64)
!121 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !122, size: 64)
!122 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!123 = !DILocalVariable(name: "argc", arg: 1, scope: !117, file: !16, line: 100, type: !7)
!124 = !DILocation(line: 100, column: 14, scope: !117)
!125 = !DILocalVariable(name: "argv", arg: 2, scope: !117, file: !16, line: 100, type: !120)
!126 = !DILocation(line: 100, column: 27, scope: !117)
!127 = !DILocation(line: 103, column: 22, scope: !117)
!128 = !DILocation(line: 103, column: 12, scope: !117)
!129 = !DILocation(line: 103, column: 5, scope: !117)
!130 = !DILocation(line: 105, column: 5, scope: !117)
!131 = !DILocation(line: 106, column: 5, scope: !117)
!132 = !DILocation(line: 107, column: 5, scope: !117)
!133 = !DILocation(line: 110, column: 5, scope: !117)
!134 = !DILocation(line: 111, column: 5, scope: !117)
!135 = !DILocation(line: 112, column: 5, scope: !117)
!136 = !DILocation(line: 114, column: 5, scope: !117)
!137 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 74, type: !60, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!138 = !DILocalVariable(name: "data", scope: !137, file: !16, line: 76, type: !4)
!139 = !DILocation(line: 76, column: 15, scope: !137)
!140 = !DILocalVariable(name: "dataBadBuffer", scope: !137, file: !16, line: 77, type: !4)
!141 = !DILocation(line: 77, column: 15, scope: !137)
!142 = !DILocation(line: 77, column: 42, scope: !137)
!143 = !DILocation(line: 77, column: 31, scope: !137)
!144 = !DILocalVariable(name: "dataGoodBuffer", scope: !137, file: !16, line: 78, type: !4)
!145 = !DILocation(line: 78, column: 15, scope: !137)
!146 = !DILocation(line: 78, column: 43, scope: !137)
!147 = !DILocation(line: 78, column: 32, scope: !137)
!148 = !DILocation(line: 80, column: 12, scope: !137)
!149 = !DILocation(line: 80, column: 10, scope: !137)
!150 = !DILocation(line: 81, column: 5, scope: !137)
!151 = !DILocation(line: 81, column: 13, scope: !137)
!152 = !DILocation(line: 82, column: 83, scope: !137)
!153 = !DILocation(line: 82, column: 5, scope: !137)
!154 = !DILocation(line: 83, column: 1, scope: !137)
