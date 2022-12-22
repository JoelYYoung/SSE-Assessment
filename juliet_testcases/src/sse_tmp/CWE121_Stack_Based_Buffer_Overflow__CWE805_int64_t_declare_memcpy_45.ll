; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_45_badData = internal global i64* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_45_goodG2BData = internal global i64* null, align 8, !dbg !8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_45_bad() #0 !dbg !23 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !33, metadata !DIExpression()), !dbg !37
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store i64* %arraydecay, i64** %data, align 8, !dbg !39
  %0 = load i64*, i64** %data, align 8, !dbg !40
  store i64* %0, i64** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_45_badData, align 8, !dbg !41
  call void @badSink(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_45_good() #0 !dbg !44 {
entry:
  call void @goodG2B(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !47 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !54, metadata !DIExpression()), !dbg !55
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %call = call i64 @time(i64* null) #6, !dbg !58
  %conv = trunc i64 %call to i32, !dbg !59
  call void @srand(i32 %conv) #6, !dbg !60
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_45_good(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_45_bad(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !68 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !69, metadata !DIExpression()), !dbg !70
  %0 = load i64*, i64** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_45_badData, align 8, !dbg !71
  store i64* %0, i64** %data, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !72, metadata !DIExpression()), !dbg !74
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !74
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !74
  %2 = load i64*, i64** %data, align 8, !dbg !75
  %3 = bitcast i64* %2 to i8*, !dbg !76
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !76
  %4 = bitcast i64* %arraydecay to i8*, !dbg !76
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %3, i8* align 16 %4, i64 800, i1 false), !dbg !76
  %5 = load i64*, i64** %data, align 8, !dbg !77
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 0, !dbg !77
  %6 = load i64, i64* %arrayidx, align 8, !dbg !77
  call void @printLongLongLine(i64 %6), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !87
  store i64* %arraydecay, i64** %data, align 8, !dbg !88
  %0 = load i64*, i64** %data, align 8, !dbg !89
  store i64* %0, i64** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_45_goodG2BData, align 8, !dbg !90
  call void @goodG2BSink(), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !93 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !94, metadata !DIExpression()), !dbg !95
  %0 = load i64*, i64** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_45_goodG2BData, align 8, !dbg !96
  store i64* %0, i64** %data, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !97, metadata !DIExpression()), !dbg !99
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !99
  %2 = load i64*, i64** %data, align 8, !dbg !100
  %3 = bitcast i64* %2 to i8*, !dbg !101
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !101
  %4 = bitcast i64* %arraydecay to i8*, !dbg !101
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %3, i8* align 16 %4, i64 800, i1 false), !dbg !101
  %5 = load i64*, i64** %data, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 0, !dbg !102
  %6 = load i64, i64* %arrayidx, align 8, !dbg !102
  call void @printLongLongLine(i64 %6), !dbg !103
  ret void, !dbg !104
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_45_badData", scope: !2, file: !10, line: 19, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_45.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_45_goodG2BData", scope: !2, file: !10, line: 20, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_45.c", directory: "/root/SSE-Assessment")
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !13, line: 27, baseType: !14)
!13 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !15, line: 43, baseType: !16)
!15 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!16 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_45_bad", scope: !10, file: !10, line: 35, type: !24, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !10, line: 37, type: !11)
!27 = !DILocation(line: 37, column: 15, scope: !23)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !23, file: !10, line: 38, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 3200, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 50)
!32 = !DILocation(line: 38, column: 13, scope: !23)
!33 = !DILocalVariable(name: "dataGoodBuffer", scope: !23, file: !10, line: 39, type: !34)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 6400, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 39, column: 13, scope: !23)
!38 = !DILocation(line: 42, column: 12, scope: !23)
!39 = !DILocation(line: 42, column: 10, scope: !23)
!40 = !DILocation(line: 43, column: 84, scope: !23)
!41 = !DILocation(line: 43, column: 82, scope: !23)
!42 = !DILocation(line: 44, column: 5, scope: !23)
!43 = !DILocation(line: 45, column: 1, scope: !23)
!44 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_45_good", scope: !10, file: !10, line: 74, type: !24, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!45 = !DILocation(line: 76, column: 5, scope: !44)
!46 = !DILocation(line: 77, column: 1, scope: !44)
!47 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 88, type: !48, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!48 = !DISubroutineType(types: !49)
!49 = !{!50, !50, !51}
!50 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !10, line: 88, type: !50)
!55 = !DILocation(line: 88, column: 14, scope: !47)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !10, line: 88, type: !51)
!57 = !DILocation(line: 88, column: 27, scope: !47)
!58 = !DILocation(line: 91, column: 22, scope: !47)
!59 = !DILocation(line: 91, column: 12, scope: !47)
!60 = !DILocation(line: 91, column: 5, scope: !47)
!61 = !DILocation(line: 93, column: 5, scope: !47)
!62 = !DILocation(line: 94, column: 5, scope: !47)
!63 = !DILocation(line: 95, column: 5, scope: !47)
!64 = !DILocation(line: 98, column: 5, scope: !47)
!65 = !DILocation(line: 99, column: 5, scope: !47)
!66 = !DILocation(line: 100, column: 5, scope: !47)
!67 = !DILocation(line: 102, column: 5, scope: !47)
!68 = distinct !DISubprogram(name: "badSink", scope: !10, file: !10, line: 24, type: !24, scopeLine: 25, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DILocalVariable(name: "data", scope: !68, file: !10, line: 26, type: !11)
!70 = !DILocation(line: 26, column: 15, scope: !68)
!71 = !DILocation(line: 26, column: 22, scope: !68)
!72 = !DILocalVariable(name: "source", scope: !73, file: !10, line: 28, type: !34)
!73 = distinct !DILexicalBlock(scope: !68, file: !10, line: 27, column: 5)
!74 = !DILocation(line: 28, column: 17, scope: !73)
!75 = !DILocation(line: 30, column: 16, scope: !73)
!76 = !DILocation(line: 30, column: 9, scope: !73)
!77 = !DILocation(line: 31, column: 27, scope: !73)
!78 = !DILocation(line: 31, column: 9, scope: !73)
!79 = !DILocation(line: 33, column: 1, scope: !68)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !10, file: !10, line: 63, type: !24, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DILocalVariable(name: "data", scope: !80, file: !10, line: 65, type: !11)
!82 = !DILocation(line: 65, column: 15, scope: !80)
!83 = !DILocalVariable(name: "dataBadBuffer", scope: !80, file: !10, line: 66, type: !29)
!84 = !DILocation(line: 66, column: 13, scope: !80)
!85 = !DILocalVariable(name: "dataGoodBuffer", scope: !80, file: !10, line: 67, type: !34)
!86 = !DILocation(line: 67, column: 13, scope: !80)
!87 = !DILocation(line: 69, column: 12, scope: !80)
!88 = !DILocation(line: 69, column: 10, scope: !80)
!89 = !DILocation(line: 70, column: 88, scope: !80)
!90 = !DILocation(line: 70, column: 86, scope: !80)
!91 = !DILocation(line: 71, column: 5, scope: !80)
!92 = !DILocation(line: 72, column: 1, scope: !80)
!93 = distinct !DISubprogram(name: "goodG2BSink", scope: !10, file: !10, line: 52, type: !24, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!94 = !DILocalVariable(name: "data", scope: !93, file: !10, line: 54, type: !11)
!95 = !DILocation(line: 54, column: 15, scope: !93)
!96 = !DILocation(line: 54, column: 22, scope: !93)
!97 = !DILocalVariable(name: "source", scope: !98, file: !10, line: 56, type: !34)
!98 = distinct !DILexicalBlock(scope: !93, file: !10, line: 55, column: 5)
!99 = !DILocation(line: 56, column: 17, scope: !98)
!100 = !DILocation(line: 58, column: 16, scope: !98)
!101 = !DILocation(line: 58, column: 9, scope: !98)
!102 = !DILocation(line: 59, column: 27, scope: !98)
!103 = !DILocation(line: 59, column: 9, scope: !98)
!104 = !DILocation(line: 61, column: 1, scope: !93)
