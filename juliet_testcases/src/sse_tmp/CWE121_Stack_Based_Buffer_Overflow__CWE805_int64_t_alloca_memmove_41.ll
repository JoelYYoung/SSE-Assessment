; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_41_badSink(i64* %data) #0 !dbg !17 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !23, metadata !DIExpression()), !dbg !28
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !28
  %1 = load i64*, i64** %data.addr, align 8, !dbg !29
  %2 = bitcast i64* %1 to i8*, !dbg !30
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !30
  %3 = bitcast i64* %arraydecay to i8*, !dbg !30
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %2, i8* align 16 %3, i64 800, i1 false), !dbg !30
  %4 = load i64*, i64** %data.addr, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 0, !dbg !31
  %5 = load i64, i64* %arrayidx, align 8, !dbg !31
  call void @printLongLongLine(i64 %5), !dbg !32
  ret void, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_41_bad() #0 !dbg !34 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !39, metadata !DIExpression()), !dbg !40
  %0 = alloca i8, i64 400, align 16, !dbg !41
  %1 = bitcast i8* %0 to i64*, !dbg !42
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !43, metadata !DIExpression()), !dbg !44
  %2 = alloca i8, i64 800, align 16, !dbg !45
  %3 = bitcast i8* %2 to i64*, !dbg !46
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !44
  %4 = load i64*, i64** %dataBadBuffer, align 8, !dbg !47
  store i64* %4, i64** %data, align 8, !dbg !48
  %5 = load i64*, i64** %data, align 8, !dbg !49
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_41_badSink(i64* %5), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_41_goodG2BSink(i64* %data) #0 !dbg !52 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !55, metadata !DIExpression()), !dbg !57
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !57
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !57
  %1 = load i64*, i64** %data.addr, align 8, !dbg !58
  %2 = bitcast i64* %1 to i8*, !dbg !59
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !59
  %3 = bitcast i64* %arraydecay to i8*, !dbg !59
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %2, i8* align 16 %3, i64 800, i1 false), !dbg !59
  %4 = load i64*, i64** %data.addr, align 8, !dbg !60
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 0, !dbg !60
  %5 = load i64, i64* %arrayidx, align 8, !dbg !60
  call void @printLongLongLine(i64 %5), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_41_good() #0 !dbg !63 {
entry:
  call void @goodG2B(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #6, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #6, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_41_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_41_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !87 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  %0 = alloca i8, i64 400, align 16, !dbg !92
  %1 = bitcast i8* %0 to i64*, !dbg !93
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  %2 = alloca i8, i64 800, align 16, !dbg !96
  %3 = bitcast i8* %2 to i64*, !dbg !97
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !95
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !98
  store i64* %4, i64** %data, align 8, !dbg !99
  %5 = load i64*, i64** %data, align 8, !dbg !100
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_41_goodG2BSink(i64* %5), !dbg !101
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_41.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !10}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 27, baseType: !7)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 43, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!9 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_41_badSink", scope: !18, file: !18, line: 21, type: !19, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_41.c", directory: "/root/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null, !4}
!21 = !DILocalVariable(name: "data", arg: 1, scope: !17, file: !18, line: 21, type: !4)
!22 = !DILocation(line: 21, column: 93, scope: !17)
!23 = !DILocalVariable(name: "source", scope: !24, file: !18, line: 24, type: !25)
!24 = distinct !DILexicalBlock(scope: !17, file: !18, line: 23, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 24, column: 17, scope: !24)
!29 = !DILocation(line: 26, column: 17, scope: !24)
!30 = !DILocation(line: 26, column: 9, scope: !24)
!31 = !DILocation(line: 27, column: 27, scope: !24)
!32 = !DILocation(line: 27, column: 9, scope: !24)
!33 = !DILocation(line: 29, column: 1, scope: !17)
!34 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_41_bad", scope: !18, file: !18, line: 31, type: !35, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DISubroutineType(types: !36)
!36 = !{null}
!37 = !DILocalVariable(name: "data", scope: !34, file: !18, line: 33, type: !4)
!38 = !DILocation(line: 33, column: 15, scope: !34)
!39 = !DILocalVariable(name: "dataBadBuffer", scope: !34, file: !18, line: 34, type: !4)
!40 = !DILocation(line: 34, column: 15, scope: !34)
!41 = !DILocation(line: 34, column: 42, scope: !34)
!42 = !DILocation(line: 34, column: 31, scope: !34)
!43 = !DILocalVariable(name: "dataGoodBuffer", scope: !34, file: !18, line: 35, type: !4)
!44 = !DILocation(line: 35, column: 15, scope: !34)
!45 = !DILocation(line: 35, column: 43, scope: !34)
!46 = !DILocation(line: 35, column: 32, scope: !34)
!47 = !DILocation(line: 38, column: 12, scope: !34)
!48 = !DILocation(line: 38, column: 10, scope: !34)
!49 = !DILocation(line: 39, column: 82, scope: !34)
!50 = !DILocation(line: 39, column: 5, scope: !34)
!51 = !DILocation(line: 40, column: 1, scope: !34)
!52 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_41_goodG2BSink", scope: !18, file: !18, line: 46, type: !19, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocalVariable(name: "data", arg: 1, scope: !52, file: !18, line: 46, type: !4)
!54 = !DILocation(line: 46, column: 97, scope: !52)
!55 = !DILocalVariable(name: "source", scope: !56, file: !18, line: 49, type: !25)
!56 = distinct !DILexicalBlock(scope: !52, file: !18, line: 48, column: 5)
!57 = !DILocation(line: 49, column: 17, scope: !56)
!58 = !DILocation(line: 51, column: 17, scope: !56)
!59 = !DILocation(line: 51, column: 9, scope: !56)
!60 = !DILocation(line: 52, column: 27, scope: !56)
!61 = !DILocation(line: 52, column: 9, scope: !56)
!62 = !DILocation(line: 54, column: 1, scope: !52)
!63 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_41_good", scope: !18, file: !18, line: 67, type: !35, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 69, column: 5, scope: !63)
!65 = !DILocation(line: 70, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 82, type: !67, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!69, !69, !70}
!69 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !18, line: 82, type: !69)
!74 = !DILocation(line: 82, column: 14, scope: !66)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !18, line: 82, type: !70)
!76 = !DILocation(line: 82, column: 27, scope: !66)
!77 = !DILocation(line: 85, column: 22, scope: !66)
!78 = !DILocation(line: 85, column: 12, scope: !66)
!79 = !DILocation(line: 85, column: 5, scope: !66)
!80 = !DILocation(line: 87, column: 5, scope: !66)
!81 = !DILocation(line: 88, column: 5, scope: !66)
!82 = !DILocation(line: 89, column: 5, scope: !66)
!83 = !DILocation(line: 92, column: 5, scope: !66)
!84 = !DILocation(line: 93, column: 5, scope: !66)
!85 = !DILocation(line: 94, column: 5, scope: !66)
!86 = !DILocation(line: 96, column: 5, scope: !66)
!87 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 57, type: !35, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !18, line: 59, type: !4)
!89 = !DILocation(line: 59, column: 15, scope: !87)
!90 = !DILocalVariable(name: "dataBadBuffer", scope: !87, file: !18, line: 60, type: !4)
!91 = !DILocation(line: 60, column: 15, scope: !87)
!92 = !DILocation(line: 60, column: 42, scope: !87)
!93 = !DILocation(line: 60, column: 31, scope: !87)
!94 = !DILocalVariable(name: "dataGoodBuffer", scope: !87, file: !18, line: 61, type: !4)
!95 = !DILocation(line: 61, column: 15, scope: !87)
!96 = !DILocation(line: 61, column: 43, scope: !87)
!97 = !DILocation(line: 61, column: 32, scope: !87)
!98 = !DILocation(line: 63, column: 12, scope: !87)
!99 = !DILocation(line: 63, column: 10, scope: !87)
!100 = !DILocation(line: 64, column: 86, scope: !87)
!101 = !DILocation(line: 64, column: 5, scope: !87)
!102 = !DILocation(line: 65, column: 1, scope: !87)
