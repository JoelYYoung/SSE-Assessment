; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_41_badSink(i64* %data) #0 !dbg !17 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !23, metadata !DIExpression()), !dbg !28
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !28
  call void @llvm.dbg.declare(metadata i64* %i, metadata !29, metadata !DIExpression()), !dbg !34
  store i64 0, i64* %i, align 8, !dbg !35
  br label %for.cond, !dbg !37

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !38
  %cmp = icmp ult i64 %1, 100, !dbg !40
  br i1 %cmp, label %for.body, label %for.end, !dbg !41

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !42
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %2, !dbg !44
  %3 = load i64, i64* %arrayidx, align 8, !dbg !44
  %4 = load i64*, i64** %data.addr, align 8, !dbg !45
  %5 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !45
  store i64 %3, i64* %arrayidx1, align 8, !dbg !47
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !49
  %inc = add i64 %6, 1, !dbg !49
  store i64 %inc, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data.addr, align 8, !dbg !54
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !54
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !54
  call void @printLongLongLine(i64 %8), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_41_bad() #0 !dbg !57 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !62, metadata !DIExpression()), !dbg !63
  %0 = alloca i8, i64 400, align 16, !dbg !64
  %1 = bitcast i8* %0 to i64*, !dbg !65
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !63
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !66, metadata !DIExpression()), !dbg !67
  %2 = alloca i8, i64 800, align 16, !dbg !68
  %3 = bitcast i8* %2 to i64*, !dbg !69
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !67
  %4 = load i64*, i64** %dataBadBuffer, align 8, !dbg !70
  store i64* %4, i64** %data, align 8, !dbg !71
  %5 = load i64*, i64** %data, align 8, !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_41_badSink(i64* %5), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_41_goodG2BSink(i64* %data) #0 !dbg !75 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !78, metadata !DIExpression()), !dbg !80
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !80
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !80
  call void @llvm.dbg.declare(metadata i64* %i, metadata !81, metadata !DIExpression()), !dbg !83
  store i64 0, i64* %i, align 8, !dbg !84
  br label %for.cond, !dbg !86

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !87
  %cmp = icmp ult i64 %1, 100, !dbg !89
  br i1 %cmp, label %for.body, label %for.end, !dbg !90

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !91
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %2, !dbg !93
  %3 = load i64, i64* %arrayidx, align 8, !dbg !93
  %4 = load i64*, i64** %data.addr, align 8, !dbg !94
  %5 = load i64, i64* %i, align 8, !dbg !95
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !94
  store i64 %3, i64* %arrayidx1, align 8, !dbg !96
  br label %for.inc, !dbg !97

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !98
  %inc = add i64 %6, 1, !dbg !98
  store i64 %inc, i64* %i, align 8, !dbg !98
  br label %for.cond, !dbg !99, !llvm.loop !100

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data.addr, align 8, !dbg !102
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !102
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !102
  call void @printLongLongLine(i64 %8), !dbg !103
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_41_good() #0 !dbg !105 {
entry:
  call void @goodG2B(), !dbg !106
  ret void, !dbg !107
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !108 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !115, metadata !DIExpression()), !dbg !116
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !117, metadata !DIExpression()), !dbg !118
  %call = call i64 @time(i64* null) #5, !dbg !119
  %conv = trunc i64 %call to i32, !dbg !120
  call void @srand(i32 %conv) #5, !dbg !121
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !122
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_41_good(), !dbg !123
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !124
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !125
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_41_bad(), !dbg !126
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !127
  ret i32 0, !dbg !128
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !129 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !130, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !132, metadata !DIExpression()), !dbg !133
  %0 = alloca i8, i64 400, align 16, !dbg !134
  %1 = bitcast i8* %0 to i64*, !dbg !135
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !133
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !136, metadata !DIExpression()), !dbg !137
  %2 = alloca i8, i64 800, align 16, !dbg !138
  %3 = bitcast i8* %2 to i64*, !dbg !139
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !137
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !140
  store i64* %4, i64** %data, align 8, !dbg !141
  %5 = load i64*, i64** %data, align 8, !dbg !142
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_41_goodG2BSink(i64* %5), !dbg !143
  ret void, !dbg !144
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !10}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 27, baseType: !7)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 44, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!9 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_41_badSink", scope: !18, file: !18, line: 21, type: !19, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null, !4}
!21 = !DILocalVariable(name: "data", arg: 1, scope: !17, file: !18, line: 21, type: !4)
!22 = !DILocation(line: 21, column: 90, scope: !17)
!23 = !DILocalVariable(name: "source", scope: !24, file: !18, line: 24, type: !25)
!24 = distinct !DILexicalBlock(scope: !17, file: !18, line: 23, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 24, column: 17, scope: !24)
!29 = !DILocalVariable(name: "i", scope: !30, file: !18, line: 26, type: !31)
!30 = distinct !DILexicalBlock(scope: !24, file: !18, line: 25, column: 9)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !32, line: 46, baseType: !33)
!32 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!33 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!34 = !DILocation(line: 26, column: 20, scope: !30)
!35 = !DILocation(line: 28, column: 20, scope: !36)
!36 = distinct !DILexicalBlock(scope: !30, file: !18, line: 28, column: 13)
!37 = !DILocation(line: 28, column: 18, scope: !36)
!38 = !DILocation(line: 28, column: 25, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !18, line: 28, column: 13)
!40 = !DILocation(line: 28, column: 27, scope: !39)
!41 = !DILocation(line: 28, column: 13, scope: !36)
!42 = !DILocation(line: 30, column: 34, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !18, line: 29, column: 13)
!44 = !DILocation(line: 30, column: 27, scope: !43)
!45 = !DILocation(line: 30, column: 17, scope: !43)
!46 = !DILocation(line: 30, column: 22, scope: !43)
!47 = !DILocation(line: 30, column: 25, scope: !43)
!48 = !DILocation(line: 31, column: 13, scope: !43)
!49 = !DILocation(line: 28, column: 35, scope: !39)
!50 = !DILocation(line: 28, column: 13, scope: !39)
!51 = distinct !{!51, !41, !52, !53}
!52 = !DILocation(line: 31, column: 13, scope: !36)
!53 = !{!"llvm.loop.mustprogress"}
!54 = !DILocation(line: 32, column: 31, scope: !30)
!55 = !DILocation(line: 32, column: 13, scope: !30)
!56 = !DILocation(line: 35, column: 1, scope: !17)
!57 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_41_bad", scope: !18, file: !18, line: 37, type: !58, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{null}
!60 = !DILocalVariable(name: "data", scope: !57, file: !18, line: 39, type: !4)
!61 = !DILocation(line: 39, column: 15, scope: !57)
!62 = !DILocalVariable(name: "dataBadBuffer", scope: !57, file: !18, line: 40, type: !4)
!63 = !DILocation(line: 40, column: 15, scope: !57)
!64 = !DILocation(line: 40, column: 42, scope: !57)
!65 = !DILocation(line: 40, column: 31, scope: !57)
!66 = !DILocalVariable(name: "dataGoodBuffer", scope: !57, file: !18, line: 41, type: !4)
!67 = !DILocation(line: 41, column: 15, scope: !57)
!68 = !DILocation(line: 41, column: 43, scope: !57)
!69 = !DILocation(line: 41, column: 32, scope: !57)
!70 = !DILocation(line: 44, column: 12, scope: !57)
!71 = !DILocation(line: 44, column: 10, scope: !57)
!72 = !DILocation(line: 45, column: 79, scope: !57)
!73 = !DILocation(line: 45, column: 5, scope: !57)
!74 = !DILocation(line: 46, column: 1, scope: !57)
!75 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_41_goodG2BSink", scope: !18, file: !18, line: 52, type: !19, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", arg: 1, scope: !75, file: !18, line: 52, type: !4)
!77 = !DILocation(line: 52, column: 94, scope: !75)
!78 = !DILocalVariable(name: "source", scope: !79, file: !18, line: 55, type: !25)
!79 = distinct !DILexicalBlock(scope: !75, file: !18, line: 54, column: 5)
!80 = !DILocation(line: 55, column: 17, scope: !79)
!81 = !DILocalVariable(name: "i", scope: !82, file: !18, line: 57, type: !31)
!82 = distinct !DILexicalBlock(scope: !79, file: !18, line: 56, column: 9)
!83 = !DILocation(line: 57, column: 20, scope: !82)
!84 = !DILocation(line: 59, column: 20, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !18, line: 59, column: 13)
!86 = !DILocation(line: 59, column: 18, scope: !85)
!87 = !DILocation(line: 59, column: 25, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !18, line: 59, column: 13)
!89 = !DILocation(line: 59, column: 27, scope: !88)
!90 = !DILocation(line: 59, column: 13, scope: !85)
!91 = !DILocation(line: 61, column: 34, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !18, line: 60, column: 13)
!93 = !DILocation(line: 61, column: 27, scope: !92)
!94 = !DILocation(line: 61, column: 17, scope: !92)
!95 = !DILocation(line: 61, column: 22, scope: !92)
!96 = !DILocation(line: 61, column: 25, scope: !92)
!97 = !DILocation(line: 62, column: 13, scope: !92)
!98 = !DILocation(line: 59, column: 35, scope: !88)
!99 = !DILocation(line: 59, column: 13, scope: !88)
!100 = distinct !{!100, !90, !101, !53}
!101 = !DILocation(line: 62, column: 13, scope: !85)
!102 = !DILocation(line: 63, column: 31, scope: !82)
!103 = !DILocation(line: 63, column: 13, scope: !82)
!104 = !DILocation(line: 66, column: 1, scope: !75)
!105 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_41_good", scope: !18, file: !18, line: 79, type: !58, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocation(line: 81, column: 5, scope: !105)
!107 = !DILocation(line: 82, column: 1, scope: !105)
!108 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 94, type: !109, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DISubroutineType(types: !110)
!110 = !{!111, !111, !112}
!111 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!112 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !113, size: 64)
!113 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !114, size: 64)
!114 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!115 = !DILocalVariable(name: "argc", arg: 1, scope: !108, file: !18, line: 94, type: !111)
!116 = !DILocation(line: 94, column: 14, scope: !108)
!117 = !DILocalVariable(name: "argv", arg: 2, scope: !108, file: !18, line: 94, type: !112)
!118 = !DILocation(line: 94, column: 27, scope: !108)
!119 = !DILocation(line: 97, column: 22, scope: !108)
!120 = !DILocation(line: 97, column: 12, scope: !108)
!121 = !DILocation(line: 97, column: 5, scope: !108)
!122 = !DILocation(line: 99, column: 5, scope: !108)
!123 = !DILocation(line: 100, column: 5, scope: !108)
!124 = !DILocation(line: 101, column: 5, scope: !108)
!125 = !DILocation(line: 104, column: 5, scope: !108)
!126 = !DILocation(line: 105, column: 5, scope: !108)
!127 = !DILocation(line: 106, column: 5, scope: !108)
!128 = !DILocation(line: 108, column: 5, scope: !108)
!129 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 69, type: !58, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!130 = !DILocalVariable(name: "data", scope: !129, file: !18, line: 71, type: !4)
!131 = !DILocation(line: 71, column: 15, scope: !129)
!132 = !DILocalVariable(name: "dataBadBuffer", scope: !129, file: !18, line: 72, type: !4)
!133 = !DILocation(line: 72, column: 15, scope: !129)
!134 = !DILocation(line: 72, column: 42, scope: !129)
!135 = !DILocation(line: 72, column: 31, scope: !129)
!136 = !DILocalVariable(name: "dataGoodBuffer", scope: !129, file: !18, line: 73, type: !4)
!137 = !DILocation(line: 73, column: 15, scope: !129)
!138 = !DILocation(line: 73, column: 43, scope: !129)
!139 = !DILocation(line: 73, column: 32, scope: !129)
!140 = !DILocation(line: 75, column: 12, scope: !129)
!141 = !DILocation(line: 75, column: 10, scope: !129)
!142 = !DILocation(line: 76, column: 83, scope: !129)
!143 = !DILocation(line: 76, column: 5, scope: !129)
!144 = !DILocation(line: 77, column: 1, scope: !129)
