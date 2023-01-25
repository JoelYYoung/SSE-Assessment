; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_31_bad() #0 !dbg !17 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %dataCopy = alloca i64*, align 8
  %data1 = alloca i64*, align 8
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
  call void @llvm.dbg.declare(metadata i64** %dataCopy, metadata !33, metadata !DIExpression()), !dbg !35
  %5 = load i64*, i64** %data, align 8, !dbg !36
  store i64* %5, i64** %dataCopy, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !37, metadata !DIExpression()), !dbg !38
  %6 = load i64*, i64** %dataCopy, align 8, !dbg !39
  store i64* %6, i64** %data1, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  %7 = bitcast [100 x i64]* %source to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 800, i1 false), !dbg !45
  %8 = load i64*, i64** %data1, align 8, !dbg !46
  %9 = bitcast i64* %8 to i8*, !dbg !47
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !47
  %10 = bitcast i64* %arraydecay to i8*, !dbg !47
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %9, i8* align 16 %10, i64 800, i1 false), !dbg !47
  %11 = load i64*, i64** %data1, align 8, !dbg !48
  %arrayidx = getelementptr inbounds i64, i64* %11, i64 0, !dbg !48
  %12 = load i64, i64* %arrayidx, align 8, !dbg !48
  call void @printLongLongLine(i64 %12), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_31_good() #0 !dbg !51 {
entry:
  call void @goodG2B(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #6, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #6, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_31_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_31_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !75 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %dataCopy = alloca i64*, align 8
  %data1 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %0 = alloca i8, i64 400, align 16, !dbg !80
  %1 = bitcast i8* %0 to i64*, !dbg !81
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !79
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %2 = alloca i8, i64 800, align 16, !dbg !84
  %3 = bitcast i8* %2 to i64*, !dbg !85
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !83
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !86
  store i64* %4, i64** %data, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata i64** %dataCopy, metadata !88, metadata !DIExpression()), !dbg !90
  %5 = load i64*, i64** %data, align 8, !dbg !91
  store i64* %5, i64** %dataCopy, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !92, metadata !DIExpression()), !dbg !93
  %6 = load i64*, i64** %dataCopy, align 8, !dbg !94
  store i64* %6, i64** %data1, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !95, metadata !DIExpression()), !dbg !97
  %7 = bitcast [100 x i64]* %source to i8*, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 800, i1 false), !dbg !97
  %8 = load i64*, i64** %data1, align 8, !dbg !98
  %9 = bitcast i64* %8 to i8*, !dbg !99
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !99
  %10 = bitcast i64* %arraydecay to i8*, !dbg !99
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %9, i8* align 16 %10, i64 800, i1 false), !dbg !99
  %11 = load i64*, i64** %data1, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i64, i64* %11, i64 0, !dbg !100
  %12 = load i64, i64* %arrayidx, align 8, !dbg !100
  call void @printLongLongLine(i64 %12), !dbg !101
  ret void, !dbg !102
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_31_bad", scope: !18, file: !18, line: 21, type: !19, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!31 = !DILocation(line: 28, column: 12, scope: !17)
!32 = !DILocation(line: 28, column: 10, scope: !17)
!33 = !DILocalVariable(name: "dataCopy", scope: !34, file: !18, line: 30, type: !4)
!34 = distinct !DILexicalBlock(scope: !17, file: !18, line: 29, column: 5)
!35 = !DILocation(line: 30, column: 19, scope: !34)
!36 = !DILocation(line: 30, column: 30, scope: !34)
!37 = !DILocalVariable(name: "data", scope: !34, file: !18, line: 31, type: !4)
!38 = !DILocation(line: 31, column: 19, scope: !34)
!39 = !DILocation(line: 31, column: 26, scope: !34)
!40 = !DILocalVariable(name: "source", scope: !41, file: !18, line: 33, type: !42)
!41 = distinct !DILexicalBlock(scope: !34, file: !18, line: 32, column: 9)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 33, column: 21, scope: !41)
!46 = !DILocation(line: 35, column: 20, scope: !41)
!47 = !DILocation(line: 35, column: 13, scope: !41)
!48 = !DILocation(line: 36, column: 31, scope: !41)
!49 = !DILocation(line: 36, column: 13, scope: !41)
!50 = !DILocation(line: 39, column: 1, scope: !17)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memcpy_31_good", scope: !18, file: !18, line: 65, type: !19, scopeLine: 66, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 67, column: 5, scope: !51)
!53 = !DILocation(line: 68, column: 1, scope: !51)
!54 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 79, type: !55, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !57, !58}
!57 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !18, line: 79, type: !57)
!62 = !DILocation(line: 79, column: 14, scope: !54)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !18, line: 79, type: !58)
!64 = !DILocation(line: 79, column: 27, scope: !54)
!65 = !DILocation(line: 82, column: 22, scope: !54)
!66 = !DILocation(line: 82, column: 12, scope: !54)
!67 = !DILocation(line: 82, column: 5, scope: !54)
!68 = !DILocation(line: 84, column: 5, scope: !54)
!69 = !DILocation(line: 85, column: 5, scope: !54)
!70 = !DILocation(line: 86, column: 5, scope: !54)
!71 = !DILocation(line: 89, column: 5, scope: !54)
!72 = !DILocation(line: 90, column: 5, scope: !54)
!73 = !DILocation(line: 91, column: 5, scope: !54)
!74 = !DILocation(line: 93, column: 5, scope: !54)
!75 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 46, type: !19, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", scope: !75, file: !18, line: 48, type: !4)
!77 = !DILocation(line: 48, column: 15, scope: !75)
!78 = !DILocalVariable(name: "dataBadBuffer", scope: !75, file: !18, line: 49, type: !4)
!79 = !DILocation(line: 49, column: 15, scope: !75)
!80 = !DILocation(line: 49, column: 42, scope: !75)
!81 = !DILocation(line: 49, column: 31, scope: !75)
!82 = !DILocalVariable(name: "dataGoodBuffer", scope: !75, file: !18, line: 50, type: !4)
!83 = !DILocation(line: 50, column: 15, scope: !75)
!84 = !DILocation(line: 50, column: 43, scope: !75)
!85 = !DILocation(line: 50, column: 32, scope: !75)
!86 = !DILocation(line: 52, column: 12, scope: !75)
!87 = !DILocation(line: 52, column: 10, scope: !75)
!88 = !DILocalVariable(name: "dataCopy", scope: !89, file: !18, line: 54, type: !4)
!89 = distinct !DILexicalBlock(scope: !75, file: !18, line: 53, column: 5)
!90 = !DILocation(line: 54, column: 19, scope: !89)
!91 = !DILocation(line: 54, column: 30, scope: !89)
!92 = !DILocalVariable(name: "data", scope: !89, file: !18, line: 55, type: !4)
!93 = !DILocation(line: 55, column: 19, scope: !89)
!94 = !DILocation(line: 55, column: 26, scope: !89)
!95 = !DILocalVariable(name: "source", scope: !96, file: !18, line: 57, type: !42)
!96 = distinct !DILexicalBlock(scope: !89, file: !18, line: 56, column: 9)
!97 = !DILocation(line: 57, column: 21, scope: !96)
!98 = !DILocation(line: 59, column: 20, scope: !96)
!99 = !DILocation(line: 59, column: 13, scope: !96)
!100 = !DILocation(line: 60, column: 31, scope: !96)
!101 = !DILocation(line: 60, column: 13, scope: !96)
!102 = !DILocation(line: 63, column: 1, scope: !75)
