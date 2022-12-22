; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_15_bad() #0 !dbg !11 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !15, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !33
  store i64* %arraydecay, i64** %data, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !35, metadata !DIExpression()), !dbg !37
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !37
  %1 = load i64*, i64** %data, align 8, !dbg !38
  %2 = bitcast i64* %1 to i8*, !dbg !39
  %arraydecay1 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !39
  %3 = bitcast i64* %arraydecay1 to i8*, !dbg !39
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %2, i8* align 16 %3, i64 800, i1 false), !dbg !39
  %4 = load i64*, i64** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 0, !dbg !40
  %5 = load i64, i64* %arrayidx, align 8, !dbg !40
  call void @printLongLongLine(i64 %5), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_15_good() #0 !dbg !43 {
entry:
  call void @goodG2B1(), !dbg !44
  call void @goodG2B2(), !dbg !45
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_15_good(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_15_bad(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !68 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !75
  store i64* %arraydecay, i64** %data, align 8, !dbg !76
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !77, metadata !DIExpression()), !dbg !79
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !79
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !79
  %1 = load i64*, i64** %data, align 8, !dbg !80
  %2 = bitcast i64* %1 to i8*, !dbg !81
  %arraydecay1 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !81
  %3 = bitcast i64* %arraydecay1 to i8*, !dbg !81
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %2, i8* align 16 %3, i64 800, i1 false), !dbg !81
  %4 = load i64*, i64** %data, align 8, !dbg !82
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 0, !dbg !82
  %5 = load i64, i64* %arrayidx, align 8, !dbg !82
  call void @printLongLongLine(i64 %5), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !85 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !92
  store i64* %arraydecay, i64** %data, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !94, metadata !DIExpression()), !dbg !96
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !96
  %1 = load i64*, i64** %data, align 8, !dbg !97
  %2 = bitcast i64* %1 to i8*, !dbg !98
  %arraydecay1 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !98
  %3 = bitcast i64* %arraydecay1 to i8*, !dbg !98
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %2, i8* align 16 %3, i64 800, i1 false), !dbg !98
  %4 = load i64*, i64** %data, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 0, !dbg !99
  %5 = load i64, i64* %arrayidx, align 8, !dbg !99
  call void @printLongLongLine(i64 %5), !dbg !100
  ret void, !dbg !101
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_15.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_15_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_15.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !18, line: 27, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !20, line: 43, baseType: !21)
!20 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!21 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!22 = !DILocation(line: 23, column: 15, scope: !11)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 24, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 50)
!27 = !DILocation(line: 24, column: 13, scope: !11)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 25, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 25, column: 13, scope: !11)
!33 = !DILocation(line: 31, column: 16, scope: !11)
!34 = !DILocation(line: 31, column: 14, scope: !11)
!35 = !DILocalVariable(name: "source", scope: !36, file: !12, line: 39, type: !29)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 38, column: 5)
!37 = !DILocation(line: 39, column: 17, scope: !36)
!38 = !DILocation(line: 41, column: 16, scope: !36)
!39 = !DILocation(line: 41, column: 9, scope: !36)
!40 = !DILocation(line: 42, column: 27, scope: !36)
!41 = !DILocation(line: 42, column: 9, scope: !36)
!42 = !DILocation(line: 44, column: 1, scope: !11)
!43 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_15_good", scope: !12, file: !12, line: 100, type: !13, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocation(line: 102, column: 5, scope: !43)
!45 = !DILocation(line: 103, column: 5, scope: !43)
!46 = !DILocation(line: 104, column: 1, scope: !43)
!47 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 116, type: !48, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{!50, !50, !51}
!50 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !12, line: 116, type: !50)
!55 = !DILocation(line: 116, column: 14, scope: !47)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !12, line: 116, type: !51)
!57 = !DILocation(line: 116, column: 27, scope: !47)
!58 = !DILocation(line: 119, column: 22, scope: !47)
!59 = !DILocation(line: 119, column: 12, scope: !47)
!60 = !DILocation(line: 119, column: 5, scope: !47)
!61 = !DILocation(line: 121, column: 5, scope: !47)
!62 = !DILocation(line: 122, column: 5, scope: !47)
!63 = !DILocation(line: 123, column: 5, scope: !47)
!64 = !DILocation(line: 126, column: 5, scope: !47)
!65 = !DILocation(line: 127, column: 5, scope: !47)
!66 = !DILocation(line: 128, column: 5, scope: !47)
!67 = !DILocation(line: 130, column: 5, scope: !47)
!68 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocalVariable(name: "data", scope: !68, file: !12, line: 53, type: !16)
!70 = !DILocation(line: 53, column: 15, scope: !68)
!71 = !DILocalVariable(name: "dataBadBuffer", scope: !68, file: !12, line: 54, type: !24)
!72 = !DILocation(line: 54, column: 13, scope: !68)
!73 = !DILocalVariable(name: "dataGoodBuffer", scope: !68, file: !12, line: 55, type: !29)
!74 = !DILocation(line: 55, column: 13, scope: !68)
!75 = !DILocation(line: 64, column: 16, scope: !68)
!76 = !DILocation(line: 64, column: 14, scope: !68)
!77 = !DILocalVariable(name: "source", scope: !78, file: !12, line: 68, type: !29)
!78 = distinct !DILexicalBlock(scope: !68, file: !12, line: 67, column: 5)
!79 = !DILocation(line: 68, column: 17, scope: !78)
!80 = !DILocation(line: 70, column: 16, scope: !78)
!81 = !DILocation(line: 70, column: 9, scope: !78)
!82 = !DILocation(line: 71, column: 27, scope: !78)
!83 = !DILocation(line: 71, column: 9, scope: !78)
!84 = !DILocation(line: 73, column: 1, scope: !68)
!85 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 76, type: !13, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "data", scope: !85, file: !12, line: 78, type: !16)
!87 = !DILocation(line: 78, column: 15, scope: !85)
!88 = !DILocalVariable(name: "dataBadBuffer", scope: !85, file: !12, line: 79, type: !24)
!89 = !DILocation(line: 79, column: 13, scope: !85)
!90 = !DILocalVariable(name: "dataGoodBuffer", scope: !85, file: !12, line: 80, type: !29)
!91 = !DILocation(line: 80, column: 13, scope: !85)
!92 = !DILocation(line: 85, column: 16, scope: !85)
!93 = !DILocation(line: 85, column: 14, scope: !85)
!94 = !DILocalVariable(name: "source", scope: !95, file: !12, line: 93, type: !29)
!95 = distinct !DILexicalBlock(scope: !85, file: !12, line: 92, column: 5)
!96 = !DILocation(line: 93, column: 17, scope: !95)
!97 = !DILocation(line: 95, column: 16, scope: !95)
!98 = !DILocation(line: 95, column: 9, scope: !95)
!99 = !DILocation(line: 96, column: 27, scope: !95)
!100 = !DILocation(line: 96, column: 9, scope: !95)
!101 = !DILocation(line: 98, column: 1, scope: !85)
