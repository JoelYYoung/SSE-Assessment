; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_44_bad() #0 !dbg !17 {
entry:
  %data = alloca i64*, align 8
  %funcPtr = alloca void (i64*)*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata void (i64*)** %funcPtr, metadata !23, metadata !DIExpression()), !dbg !27
  store void (i64*)* @badSink, void (i64*)** %funcPtr, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 400, align 16, !dbg !30
  %1 = bitcast i8* %0 to i64*, !dbg !31
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !32, metadata !DIExpression()), !dbg !33
  %2 = alloca i8, i64 800, align 16, !dbg !34
  %3 = bitcast i8* %2 to i64*, !dbg !35
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !33
  %4 = load i64*, i64** %dataBadBuffer, align 8, !dbg !36
  store i64* %4, i64** %data, align 8, !dbg !37
  %5 = load void (i64*)*, void (i64*)** %funcPtr, align 8, !dbg !38
  %6 = load i64*, i64** %data, align 8, !dbg !39
  call void %5(i64* %6), !dbg !38
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i64* %data) #0 !dbg !41 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !44, metadata !DIExpression()), !dbg !49
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !49
  %1 = load i64*, i64** %data.addr, align 8, !dbg !50
  %2 = bitcast i64* %1 to i8*, !dbg !51
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !51
  %3 = bitcast i64* %arraydecay to i8*, !dbg !51
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %2, i8* align 16 %3, i64 800, i1 false), !dbg !51
  %4 = load i64*, i64** %data.addr, align 8, !dbg !52
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 0, !dbg !52
  %5 = load i64, i64* %arrayidx, align 8, !dbg !52
  call void @printLongLongLine(i64 %5), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_44_good() #0 !dbg !55 {
entry:
  call void @goodG2B(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #6, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #6, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_44_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_44_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %data = alloca i64*, align 8
  %funcPtr = alloca void (i64*)*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata void (i64*)** %funcPtr, metadata !82, metadata !DIExpression()), !dbg !83
  store void (i64*)* @goodG2BSink, void (i64*)** %funcPtr, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  %0 = alloca i8, i64 400, align 16, !dbg !86
  %1 = bitcast i8* %0 to i64*, !dbg !87
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %2 = alloca i8, i64 800, align 16, !dbg !90
  %3 = bitcast i8* %2 to i64*, !dbg !91
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !89
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !92
  store i64* %4, i64** %data, align 8, !dbg !93
  %5 = load void (i64*)*, void (i64*)** %funcPtr, align 8, !dbg !94
  %6 = load i64*, i64** %data, align 8, !dbg !95
  call void %5(i64* %6), !dbg !94
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i64* %data) #0 !dbg !97 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !100, metadata !DIExpression()), !dbg !102
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !102
  %1 = load i64*, i64** %data.addr, align 8, !dbg !103
  %2 = bitcast i64* %1 to i8*, !dbg !104
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !104
  %3 = bitcast i64* %arraydecay to i8*, !dbg !104
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %2, i8* align 16 %3, i64 800, i1 false), !dbg !104
  %4 = load i64*, i64** %data.addr, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 0, !dbg !105
  %5 = load i64, i64* %arrayidx, align 8, !dbg !105
  call void @printLongLongLine(i64 %5), !dbg !106
  ret void, !dbg !107
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_44.c", directory: "/root/SSE-Assessment")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_44_bad", scope: !18, file: !18, line: 31, type: !19, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_44.c", directory: "/root/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 33, type: !4)
!22 = !DILocation(line: 33, column: 15, scope: !17)
!23 = !DILocalVariable(name: "funcPtr", scope: !17, file: !18, line: 35, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DISubroutineType(types: !26)
!26 = !{null, !4}
!27 = !DILocation(line: 35, column: 12, scope: !17)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 36, type: !4)
!29 = !DILocation(line: 36, column: 15, scope: !17)
!30 = !DILocation(line: 36, column: 42, scope: !17)
!31 = !DILocation(line: 36, column: 31, scope: !17)
!32 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 37, type: !4)
!33 = !DILocation(line: 37, column: 15, scope: !17)
!34 = !DILocation(line: 37, column: 43, scope: !17)
!35 = !DILocation(line: 37, column: 32, scope: !17)
!36 = !DILocation(line: 40, column: 12, scope: !17)
!37 = !DILocation(line: 40, column: 10, scope: !17)
!38 = !DILocation(line: 42, column: 5, scope: !17)
!39 = !DILocation(line: 42, column: 13, scope: !17)
!40 = !DILocation(line: 43, column: 1, scope: !17)
!41 = distinct !DISubprogram(name: "badSink", scope: !18, file: !18, line: 21, type: !25, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocalVariable(name: "data", arg: 1, scope: !41, file: !18, line: 21, type: !4)
!43 = !DILocation(line: 21, column: 31, scope: !41)
!44 = !DILocalVariable(name: "source", scope: !45, file: !18, line: 24, type: !46)
!45 = distinct !DILexicalBlock(scope: !41, file: !18, line: 23, column: 5)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 100)
!49 = !DILocation(line: 24, column: 17, scope: !45)
!50 = !DILocation(line: 26, column: 17, scope: !45)
!51 = !DILocation(line: 26, column: 9, scope: !45)
!52 = !DILocation(line: 27, column: 27, scope: !45)
!53 = !DILocation(line: 27, column: 9, scope: !45)
!54 = !DILocation(line: 29, column: 1, scope: !41)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_44_good", scope: !18, file: !18, line: 71, type: !19, scopeLine: 72, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 73, column: 5, scope: !55)
!57 = !DILocation(line: 74, column: 1, scope: !55)
!58 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 85, type: !59, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!61, !61, !62}
!61 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !18, line: 85, type: !61)
!66 = !DILocation(line: 85, column: 14, scope: !58)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !18, line: 85, type: !62)
!68 = !DILocation(line: 85, column: 27, scope: !58)
!69 = !DILocation(line: 88, column: 22, scope: !58)
!70 = !DILocation(line: 88, column: 12, scope: !58)
!71 = !DILocation(line: 88, column: 5, scope: !58)
!72 = !DILocation(line: 90, column: 5, scope: !58)
!73 = !DILocation(line: 91, column: 5, scope: !58)
!74 = !DILocation(line: 92, column: 5, scope: !58)
!75 = !DILocation(line: 95, column: 5, scope: !58)
!76 = !DILocation(line: 96, column: 5, scope: !58)
!77 = !DILocation(line: 97, column: 5, scope: !58)
!78 = !DILocation(line: 99, column: 5, scope: !58)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 60, type: !19, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !18, line: 62, type: !4)
!81 = !DILocation(line: 62, column: 15, scope: !79)
!82 = !DILocalVariable(name: "funcPtr", scope: !79, file: !18, line: 63, type: !24)
!83 = !DILocation(line: 63, column: 12, scope: !79)
!84 = !DILocalVariable(name: "dataBadBuffer", scope: !79, file: !18, line: 64, type: !4)
!85 = !DILocation(line: 64, column: 15, scope: !79)
!86 = !DILocation(line: 64, column: 42, scope: !79)
!87 = !DILocation(line: 64, column: 31, scope: !79)
!88 = !DILocalVariable(name: "dataGoodBuffer", scope: !79, file: !18, line: 65, type: !4)
!89 = !DILocation(line: 65, column: 15, scope: !79)
!90 = !DILocation(line: 65, column: 43, scope: !79)
!91 = !DILocation(line: 65, column: 32, scope: !79)
!92 = !DILocation(line: 67, column: 12, scope: !79)
!93 = !DILocation(line: 67, column: 10, scope: !79)
!94 = !DILocation(line: 68, column: 5, scope: !79)
!95 = !DILocation(line: 68, column: 13, scope: !79)
!96 = !DILocation(line: 69, column: 1, scope: !79)
!97 = distinct !DISubprogram(name: "goodG2BSink", scope: !18, file: !18, line: 50, type: !25, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", arg: 1, scope: !97, file: !18, line: 50, type: !4)
!99 = !DILocation(line: 50, column: 35, scope: !97)
!100 = !DILocalVariable(name: "source", scope: !101, file: !18, line: 53, type: !46)
!101 = distinct !DILexicalBlock(scope: !97, file: !18, line: 52, column: 5)
!102 = !DILocation(line: 53, column: 17, scope: !101)
!103 = !DILocation(line: 55, column: 17, scope: !101)
!104 = !DILocation(line: 55, column: 9, scope: !101)
!105 = !DILocation(line: 56, column: 27, scope: !101)
!106 = !DILocation(line: 56, column: 9, scope: !101)
!107 = !DILocation(line: 58, column: 1, scope: !97)
