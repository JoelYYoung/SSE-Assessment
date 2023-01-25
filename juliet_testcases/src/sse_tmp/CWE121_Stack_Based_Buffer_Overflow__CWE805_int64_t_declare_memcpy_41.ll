; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_41_badSink(i64* %data) #0 !dbg !11 {
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
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %2, i8* align 16 %3, i64 800, i1 false), !dbg !30
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
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_41_bad() #0 !dbg !34 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !39, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !44, metadata !DIExpression()), !dbg !45
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !46
  store i64* %arraydecay, i64** %data, align 8, !dbg !47
  %0 = load i64*, i64** %data, align 8, !dbg !48
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_41_badSink(i64* %0), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_41_goodG2BSink(i64* %data) #0 !dbg !51 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !54, metadata !DIExpression()), !dbg !56
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !56
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !56
  %1 = load i64*, i64** %data.addr, align 8, !dbg !57
  %2 = bitcast i64* %1 to i8*, !dbg !58
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !58
  %3 = bitcast i64* %arraydecay to i8*, !dbg !58
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %2, i8* align 16 %3, i64 800, i1 false), !dbg !58
  %4 = load i64*, i64** %data.addr, align 8, !dbg !59
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 0, !dbg !59
  %5 = load i64, i64* %arrayidx, align 8, !dbg !59
  call void @printLongLongLine(i64 %5), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_41_good() #0 !dbg !62 {
entry:
  call void @goodG2B(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !65 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* null) #6, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #6, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_41_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_41_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !86 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !93
  store i64* %arraydecay, i64** %data, align 8, !dbg !94
  %0 = load i64*, i64** %data, align 8, !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_41_goodG2BSink(i64* %0), !dbg !96
  ret void, !dbg !97
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_41.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_41_badSink", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_41.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !17, line: 27, baseType: !18)
!17 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !19, line: 44, baseType: !20)
!19 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!20 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!21 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 21, type: !15)
!22 = !DILocation(line: 21, column: 93, scope: !11)
!23 = !DILocalVariable(name: "source", scope: !24, file: !12, line: 24, type: !25)
!24 = distinct !DILexicalBlock(scope: !11, file: !12, line: 23, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 6400, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 24, column: 17, scope: !24)
!29 = !DILocation(line: 26, column: 16, scope: !24)
!30 = !DILocation(line: 26, column: 9, scope: !24)
!31 = !DILocation(line: 27, column: 27, scope: !24)
!32 = !DILocation(line: 27, column: 9, scope: !24)
!33 = !DILocation(line: 29, column: 1, scope: !11)
!34 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_41_bad", scope: !12, file: !12, line: 31, type: !35, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DISubroutineType(types: !36)
!36 = !{null}
!37 = !DILocalVariable(name: "data", scope: !34, file: !12, line: 33, type: !15)
!38 = !DILocation(line: 33, column: 15, scope: !34)
!39 = !DILocalVariable(name: "dataBadBuffer", scope: !34, file: !12, line: 34, type: !40)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 3200, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 34, column: 13, scope: !34)
!44 = !DILocalVariable(name: "dataGoodBuffer", scope: !34, file: !12, line: 35, type: !25)
!45 = !DILocation(line: 35, column: 13, scope: !34)
!46 = !DILocation(line: 38, column: 12, scope: !34)
!47 = !DILocation(line: 38, column: 10, scope: !34)
!48 = !DILocation(line: 39, column: 82, scope: !34)
!49 = !DILocation(line: 39, column: 5, scope: !34)
!50 = !DILocation(line: 40, column: 1, scope: !34)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_41_goodG2BSink", scope: !12, file: !12, line: 46, type: !13, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocalVariable(name: "data", arg: 1, scope: !51, file: !12, line: 46, type: !15)
!53 = !DILocation(line: 46, column: 97, scope: !51)
!54 = !DILocalVariable(name: "source", scope: !55, file: !12, line: 49, type: !25)
!55 = distinct !DILexicalBlock(scope: !51, file: !12, line: 48, column: 5)
!56 = !DILocation(line: 49, column: 17, scope: !55)
!57 = !DILocation(line: 51, column: 16, scope: !55)
!58 = !DILocation(line: 51, column: 9, scope: !55)
!59 = !DILocation(line: 52, column: 27, scope: !55)
!60 = !DILocation(line: 52, column: 9, scope: !55)
!61 = !DILocation(line: 54, column: 1, scope: !51)
!62 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_41_good", scope: !12, file: !12, line: 67, type: !35, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 69, column: 5, scope: !62)
!64 = !DILocation(line: 70, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 82, type: !66, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{!68, !68, !69}
!68 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !12, line: 82, type: !68)
!73 = !DILocation(line: 82, column: 14, scope: !65)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !12, line: 82, type: !69)
!75 = !DILocation(line: 82, column: 27, scope: !65)
!76 = !DILocation(line: 85, column: 22, scope: !65)
!77 = !DILocation(line: 85, column: 12, scope: !65)
!78 = !DILocation(line: 85, column: 5, scope: !65)
!79 = !DILocation(line: 87, column: 5, scope: !65)
!80 = !DILocation(line: 88, column: 5, scope: !65)
!81 = !DILocation(line: 89, column: 5, scope: !65)
!82 = !DILocation(line: 92, column: 5, scope: !65)
!83 = !DILocation(line: 93, column: 5, scope: !65)
!84 = !DILocation(line: 94, column: 5, scope: !65)
!85 = !DILocation(line: 96, column: 5, scope: !65)
!86 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 57, type: !35, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "data", scope: !86, file: !12, line: 59, type: !15)
!88 = !DILocation(line: 59, column: 15, scope: !86)
!89 = !DILocalVariable(name: "dataBadBuffer", scope: !86, file: !12, line: 60, type: !40)
!90 = !DILocation(line: 60, column: 13, scope: !86)
!91 = !DILocalVariable(name: "dataGoodBuffer", scope: !86, file: !12, line: 61, type: !25)
!92 = !DILocation(line: 61, column: 13, scope: !86)
!93 = !DILocation(line: 63, column: 12, scope: !86)
!94 = !DILocation(line: 63, column: 10, scope: !86)
!95 = !DILocation(line: 64, column: 86, scope: !86)
!96 = !DILocation(line: 64, column: 5, scope: !86)
!97 = !DILocation(line: 65, column: 1, scope: !86)
