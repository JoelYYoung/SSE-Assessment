; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_15_bad() #0 !dbg !17 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = alloca i8, i64 400, align 16, !dbg !25
  %1 = bitcast i8* %0 to i64*, !dbg !26
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %2 = alloca i8, i64 800, align 16, !dbg !29
  %3 = bitcast i8* %2 to i64*, !dbg !30
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !28
  %4 = load i64*, i64** %dataBadBuffer, align 8, !dbg !31
  store i64* %4, i64** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !33, metadata !DIExpression()), !dbg !38
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !38
  %6 = load i64*, i64** %data, align 8, !dbg !39
  %7 = bitcast i64* %6 to i8*, !dbg !40
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !40
  %8 = bitcast i64* %arraydecay to i8*, !dbg !40
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %7, i8* align 16 %8, i64 800, i1 false), !dbg !40
  %9 = load i64*, i64** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i64, i64* %9, i64 0, !dbg !41
  %10 = load i64, i64* %arrayidx, align 8, !dbg !41
  call void @printLongLongLine(i64 %10), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_15_good() #0 !dbg !44 {
entry:
  call void @goodG2B1(), !dbg !45
  call void @goodG2B2(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* null) #6, !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 %conv) #6, !dbg !61
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_15_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_15_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !69 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  %0 = alloca i8, i64 400, align 16, !dbg !74
  %1 = bitcast i8* %0 to i64*, !dbg !75
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !73
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %2 = alloca i8, i64 800, align 16, !dbg !78
  %3 = bitcast i8* %2 to i64*, !dbg !79
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !77
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !80
  store i64* %4, i64** %data, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !82, metadata !DIExpression()), !dbg !84
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !84
  %6 = load i64*, i64** %data, align 8, !dbg !85
  %7 = bitcast i64* %6 to i8*, !dbg !86
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !86
  %8 = bitcast i64* %arraydecay to i8*, !dbg !86
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %7, i8* align 16 %8, i64 800, i1 false), !dbg !86
  %9 = load i64*, i64** %data, align 8, !dbg !87
  %arrayidx = getelementptr inbounds i64, i64* %9, i64 0, !dbg !87
  %10 = load i64, i64* %arrayidx, align 8, !dbg !87
  call void @printLongLongLine(i64 %10), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !90 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  %0 = alloca i8, i64 400, align 16, !dbg !95
  %1 = bitcast i8* %0 to i64*, !dbg !96
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %2 = alloca i8, i64 800, align 16, !dbg !99
  %3 = bitcast i8* %2 to i64*, !dbg !100
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !98
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !101
  store i64* %4, i64** %data, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !103, metadata !DIExpression()), !dbg !105
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !105
  %6 = load i64*, i64** %data, align 8, !dbg !106
  %7 = bitcast i64* %6 to i8*, !dbg !107
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !107
  %8 = bitcast i64* %arraydecay to i8*, !dbg !107
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %7, i8* align 16 %8, i64 800, i1 false), !dbg !107
  %9 = load i64*, i64** %data, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i64, i64* %9, i64 0, !dbg !108
  %10 = load i64, i64* %arrayidx, align 8, !dbg !108
  call void @printLongLongLine(i64 %10), !dbg !109
  ret void, !dbg !110
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_15_bad", scope: !18, file: !18, line: 21, type: !19, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_15.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 23, type: !4)
!22 = !DILocation(line: 23, column: 15, scope: !17)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 24, type: !4)
!24 = !DILocation(line: 24, column: 15, scope: !17)
!25 = !DILocation(line: 24, column: 42, scope: !17)
!26 = !DILocation(line: 24, column: 31, scope: !17)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 25, type: !4)
!28 = !DILocation(line: 25, column: 15, scope: !17)
!29 = !DILocation(line: 25, column: 43, scope: !17)
!30 = !DILocation(line: 25, column: 32, scope: !17)
!31 = !DILocation(line: 31, column: 16, scope: !17)
!32 = !DILocation(line: 31, column: 14, scope: !17)
!33 = !DILocalVariable(name: "source", scope: !34, file: !18, line: 39, type: !35)
!34 = distinct !DILexicalBlock(scope: !17, file: !18, line: 38, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 39, column: 17, scope: !34)
!39 = !DILocation(line: 41, column: 16, scope: !34)
!40 = !DILocation(line: 41, column: 9, scope: !34)
!41 = !DILocation(line: 42, column: 27, scope: !34)
!42 = !DILocation(line: 42, column: 9, scope: !34)
!43 = !DILocation(line: 44, column: 1, scope: !17)
!44 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_15_good", scope: !18, file: !18, line: 100, type: !19, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 102, column: 5, scope: !44)
!46 = !DILocation(line: 103, column: 5, scope: !44)
!47 = !DILocation(line: 104, column: 1, scope: !44)
!48 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 116, type: !49, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{!51, !51, !52}
!51 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !18, line: 116, type: !51)
!56 = !DILocation(line: 116, column: 14, scope: !48)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !18, line: 116, type: !52)
!58 = !DILocation(line: 116, column: 27, scope: !48)
!59 = !DILocation(line: 119, column: 22, scope: !48)
!60 = !DILocation(line: 119, column: 12, scope: !48)
!61 = !DILocation(line: 119, column: 5, scope: !48)
!62 = !DILocation(line: 121, column: 5, scope: !48)
!63 = !DILocation(line: 122, column: 5, scope: !48)
!64 = !DILocation(line: 123, column: 5, scope: !48)
!65 = !DILocation(line: 126, column: 5, scope: !48)
!66 = !DILocation(line: 127, column: 5, scope: !48)
!67 = !DILocation(line: 128, column: 5, scope: !48)
!68 = !DILocation(line: 130, column: 5, scope: !48)
!69 = distinct !DISubprogram(name: "goodG2B1", scope: !18, file: !18, line: 51, type: !19, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "data", scope: !69, file: !18, line: 53, type: !4)
!71 = !DILocation(line: 53, column: 15, scope: !69)
!72 = !DILocalVariable(name: "dataBadBuffer", scope: !69, file: !18, line: 54, type: !4)
!73 = !DILocation(line: 54, column: 15, scope: !69)
!74 = !DILocation(line: 54, column: 42, scope: !69)
!75 = !DILocation(line: 54, column: 31, scope: !69)
!76 = !DILocalVariable(name: "dataGoodBuffer", scope: !69, file: !18, line: 55, type: !4)
!77 = !DILocation(line: 55, column: 15, scope: !69)
!78 = !DILocation(line: 55, column: 43, scope: !69)
!79 = !DILocation(line: 55, column: 32, scope: !69)
!80 = !DILocation(line: 64, column: 16, scope: !69)
!81 = !DILocation(line: 64, column: 14, scope: !69)
!82 = !DILocalVariable(name: "source", scope: !83, file: !18, line: 68, type: !35)
!83 = distinct !DILexicalBlock(scope: !69, file: !18, line: 67, column: 5)
!84 = !DILocation(line: 68, column: 17, scope: !83)
!85 = !DILocation(line: 70, column: 16, scope: !83)
!86 = !DILocation(line: 70, column: 9, scope: !83)
!87 = !DILocation(line: 71, column: 27, scope: !83)
!88 = !DILocation(line: 71, column: 9, scope: !83)
!89 = !DILocation(line: 73, column: 1, scope: !69)
!90 = distinct !DISubprogram(name: "goodG2B2", scope: !18, file: !18, line: 76, type: !19, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocalVariable(name: "data", scope: !90, file: !18, line: 78, type: !4)
!92 = !DILocation(line: 78, column: 15, scope: !90)
!93 = !DILocalVariable(name: "dataBadBuffer", scope: !90, file: !18, line: 79, type: !4)
!94 = !DILocation(line: 79, column: 15, scope: !90)
!95 = !DILocation(line: 79, column: 42, scope: !90)
!96 = !DILocation(line: 79, column: 31, scope: !90)
!97 = !DILocalVariable(name: "dataGoodBuffer", scope: !90, file: !18, line: 80, type: !4)
!98 = !DILocation(line: 80, column: 15, scope: !90)
!99 = !DILocation(line: 80, column: 43, scope: !90)
!100 = !DILocation(line: 80, column: 32, scope: !90)
!101 = !DILocation(line: 85, column: 16, scope: !90)
!102 = !DILocation(line: 85, column: 14, scope: !90)
!103 = !DILocalVariable(name: "source", scope: !104, file: !18, line: 93, type: !35)
!104 = distinct !DILexicalBlock(scope: !90, file: !18, line: 92, column: 5)
!105 = !DILocation(line: 93, column: 17, scope: !104)
!106 = !DILocation(line: 95, column: 16, scope: !104)
!107 = !DILocation(line: 95, column: 9, scope: !104)
!108 = !DILocation(line: 96, column: 27, scope: !104)
!109 = !DILocation(line: 96, column: 9, scope: !104)
!110 = !DILocation(line: 98, column: 1, scope: !90)
