; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_17_bad() #0 !dbg !17 {
entry:
  %i = alloca i32, align 4
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !21, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i64** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 400, align 16, !dbg !28
  %1 = bitcast i8* %0 to i64*, !dbg !29
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = alloca i8, i64 800, align 16, !dbg !32
  %3 = bitcast i8* %2 to i64*, !dbg !33
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !31
  store i32 0, i32* %i, align 4, !dbg !34
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %i, align 4, !dbg !37
  %cmp = icmp slt i32 %4, 1, !dbg !39
  br i1 %cmp, label %for.body, label %for.end, !dbg !40

for.body:                                         ; preds = %for.cond
  %5 = load i64*, i64** %dataBadBuffer, align 8, !dbg !41
  store i64* %5, i64** %data, align 8, !dbg !43
  br label %for.inc, !dbg !44

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !45
  %inc = add nsw i32 %6, 1, !dbg !45
  store i32 %inc, i32* %i, align 4, !dbg !45
  br label %for.cond, !dbg !46, !llvm.loop !47

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !50, metadata !DIExpression()), !dbg !55
  %7 = bitcast [100 x i64]* %source to i8*, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 800, i1 false), !dbg !55
  %8 = load i64*, i64** %data, align 8, !dbg !56
  %9 = bitcast i64* %8 to i8*, !dbg !57
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !57
  %10 = bitcast i64* %arraydecay to i8*, !dbg !57
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %9, i8* align 16 %10, i64 800, i1 false), !dbg !57
  %11 = load i64*, i64** %data, align 8, !dbg !58
  %arrayidx = getelementptr inbounds i64, i64* %11, i64 0, !dbg !58
  %12 = load i64, i64* %arrayidx, align 8, !dbg !58
  call void @printLongLongLine(i64 %12), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_17_good() #0 !dbg !61 {
entry:
  call void @goodG2B(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* null) #6, !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 %conv) #6, !dbg !76
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_17_good(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_17_bad(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !84 {
entry:
  %h = alloca i32, align 4
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i64** %data, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  %0 = alloca i8, i64 400, align 16, !dbg !91
  %1 = bitcast i8* %0 to i64*, !dbg !92
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  %2 = alloca i8, i64 800, align 16, !dbg !95
  %3 = bitcast i8* %2 to i64*, !dbg !96
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !94
  store i32 0, i32* %h, align 4, !dbg !97
  br label %for.cond, !dbg !99

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %h, align 4, !dbg !100
  %cmp = icmp slt i32 %4, 1, !dbg !102
  br i1 %cmp, label %for.body, label %for.end, !dbg !103

for.body:                                         ; preds = %for.cond
  %5 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !104
  store i64* %5, i64** %data, align 8, !dbg !106
  br label %for.inc, !dbg !107

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %h, align 4, !dbg !108
  %inc = add nsw i32 %6, 1, !dbg !108
  store i32 %inc, i32* %h, align 4, !dbg !108
  br label %for.cond, !dbg !109, !llvm.loop !110

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !112, metadata !DIExpression()), !dbg !114
  %7 = bitcast [100 x i64]* %source to i8*, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 800, i1 false), !dbg !114
  %8 = load i64*, i64** %data, align 8, !dbg !115
  %9 = bitcast i64* %8 to i8*, !dbg !116
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !116
  %10 = bitcast i64* %arraydecay to i8*, !dbg !116
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %9, i8* align 16 %10, i64 800, i1 false), !dbg !116
  %11 = load i64*, i64** %data, align 8, !dbg !117
  %arrayidx = getelementptr inbounds i64, i64* %11, i64 0, !dbg !117
  %12 = load i64, i64* %arrayidx, align 8, !dbg !117
  call void @printLongLongLine(i64 %12), !dbg !118
  ret void, !dbg !119
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_17_bad", scope: !18, file: !18, line: 21, type: !19, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_17.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "i", scope: !17, file: !18, line: 23, type: !22)
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocation(line: 23, column: 9, scope: !17)
!24 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 24, type: !4)
!25 = !DILocation(line: 24, column: 15, scope: !17)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 25, type: !4)
!27 = !DILocation(line: 25, column: 15, scope: !17)
!28 = !DILocation(line: 25, column: 42, scope: !17)
!29 = !DILocation(line: 25, column: 31, scope: !17)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 26, type: !4)
!31 = !DILocation(line: 26, column: 15, scope: !17)
!32 = !DILocation(line: 26, column: 43, scope: !17)
!33 = !DILocation(line: 26, column: 32, scope: !17)
!34 = !DILocation(line: 27, column: 11, scope: !35)
!35 = distinct !DILexicalBlock(scope: !17, file: !18, line: 27, column: 5)
!36 = !DILocation(line: 27, column: 9, scope: !35)
!37 = !DILocation(line: 27, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !18, line: 27, column: 5)
!39 = !DILocation(line: 27, column: 18, scope: !38)
!40 = !DILocation(line: 27, column: 5, scope: !35)
!41 = !DILocation(line: 31, column: 16, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !18, line: 28, column: 5)
!43 = !DILocation(line: 31, column: 14, scope: !42)
!44 = !DILocation(line: 32, column: 5, scope: !42)
!45 = !DILocation(line: 27, column: 24, scope: !38)
!46 = !DILocation(line: 27, column: 5, scope: !38)
!47 = distinct !{!47, !40, !48, !49}
!48 = !DILocation(line: 32, column: 5, scope: !35)
!49 = !{!"llvm.loop.mustprogress"}
!50 = !DILocalVariable(name: "source", scope: !51, file: !18, line: 34, type: !52)
!51 = distinct !DILexicalBlock(scope: !17, file: !18, line: 33, column: 5)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 100)
!55 = !DILocation(line: 34, column: 17, scope: !51)
!56 = !DILocation(line: 36, column: 16, scope: !51)
!57 = !DILocation(line: 36, column: 9, scope: !51)
!58 = !DILocation(line: 37, column: 27, scope: !51)
!59 = !DILocation(line: 37, column: 9, scope: !51)
!60 = !DILocation(line: 39, column: 1, scope: !17)
!61 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_17_good", scope: !18, file: !18, line: 65, type: !19, scopeLine: 66, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 67, column: 5, scope: !61)
!63 = !DILocation(line: 68, column: 1, scope: !61)
!64 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 80, type: !65, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!22, !22, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !18, line: 80, type: !22)
!71 = !DILocation(line: 80, column: 14, scope: !64)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !18, line: 80, type: !67)
!73 = !DILocation(line: 80, column: 27, scope: !64)
!74 = !DILocation(line: 83, column: 22, scope: !64)
!75 = !DILocation(line: 83, column: 12, scope: !64)
!76 = !DILocation(line: 83, column: 5, scope: !64)
!77 = !DILocation(line: 85, column: 5, scope: !64)
!78 = !DILocation(line: 86, column: 5, scope: !64)
!79 = !DILocation(line: 87, column: 5, scope: !64)
!80 = !DILocation(line: 90, column: 5, scope: !64)
!81 = !DILocation(line: 91, column: 5, scope: !64)
!82 = !DILocation(line: 92, column: 5, scope: !64)
!83 = !DILocation(line: 94, column: 5, scope: !64)
!84 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 46, type: !19, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "h", scope: !84, file: !18, line: 48, type: !22)
!86 = !DILocation(line: 48, column: 9, scope: !84)
!87 = !DILocalVariable(name: "data", scope: !84, file: !18, line: 49, type: !4)
!88 = !DILocation(line: 49, column: 15, scope: !84)
!89 = !DILocalVariable(name: "dataBadBuffer", scope: !84, file: !18, line: 50, type: !4)
!90 = !DILocation(line: 50, column: 15, scope: !84)
!91 = !DILocation(line: 50, column: 42, scope: !84)
!92 = !DILocation(line: 50, column: 31, scope: !84)
!93 = !DILocalVariable(name: "dataGoodBuffer", scope: !84, file: !18, line: 51, type: !4)
!94 = !DILocation(line: 51, column: 15, scope: !84)
!95 = !DILocation(line: 51, column: 43, scope: !84)
!96 = !DILocation(line: 51, column: 32, scope: !84)
!97 = !DILocation(line: 52, column: 11, scope: !98)
!98 = distinct !DILexicalBlock(scope: !84, file: !18, line: 52, column: 5)
!99 = !DILocation(line: 52, column: 9, scope: !98)
!100 = !DILocation(line: 52, column: 16, scope: !101)
!101 = distinct !DILexicalBlock(scope: !98, file: !18, line: 52, column: 5)
!102 = !DILocation(line: 52, column: 18, scope: !101)
!103 = !DILocation(line: 52, column: 5, scope: !98)
!104 = !DILocation(line: 55, column: 16, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !18, line: 53, column: 5)
!106 = !DILocation(line: 55, column: 14, scope: !105)
!107 = !DILocation(line: 56, column: 5, scope: !105)
!108 = !DILocation(line: 52, column: 24, scope: !101)
!109 = !DILocation(line: 52, column: 5, scope: !101)
!110 = distinct !{!110, !103, !111, !49}
!111 = !DILocation(line: 56, column: 5, scope: !98)
!112 = !DILocalVariable(name: "source", scope: !113, file: !18, line: 58, type: !52)
!113 = distinct !DILexicalBlock(scope: !84, file: !18, line: 57, column: 5)
!114 = !DILocation(line: 58, column: 17, scope: !113)
!115 = !DILocation(line: 60, column: 16, scope: !113)
!116 = !DILocation(line: 60, column: 9, scope: !113)
!117 = !DILocation(line: 61, column: 27, scope: !113)
!118 = !DILocation(line: 61, column: 9, scope: !113)
!119 = !DILocation(line: 63, column: 1, scope: !84)
