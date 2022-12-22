; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_44_bad() #0 !dbg !11 {
entry:
  %data = alloca i64*, align 8
  %funcPtr = alloca void (i64*)*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !15, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata void (i64*)** %funcPtr, metadata !23, metadata !DIExpression()), !dbg !27
  store void (i64*)* @badSink, void (i64*)** %funcPtr, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !33, metadata !DIExpression()), !dbg !37
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store i64* %arraydecay, i64** %data, align 8, !dbg !39
  %0 = load void (i64*)*, void (i64*)** %funcPtr, align 8, !dbg !40
  %1 = load i64*, i64** %data, align 8, !dbg !41
  call void %0(i64* %1), !dbg !40
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i64* %data) #0 !dbg !43 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !46, metadata !DIExpression()), !dbg !48
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !48
  %1 = load i64*, i64** %data.addr, align 8, !dbg !49
  %2 = bitcast i64* %1 to i8*, !dbg !50
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !50
  %3 = bitcast i64* %arraydecay to i8*, !dbg !50
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %2, i8* align 16 %3, i64 800, i1 false), !dbg !50
  %4 = load i64*, i64** %data.addr, align 8, !dbg !51
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 0, !dbg !51
  %5 = load i64, i64* %arrayidx, align 8, !dbg !51
  call void @printLongLongLine(i64 %5), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_44_good() #0 !dbg !54 {
entry:
  call void @goodG2B(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #6, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #6, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_44_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_44_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !78 {
entry:
  %data = alloca i64*, align 8
  %funcPtr = alloca void (i64*)*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata void (i64*)** %funcPtr, metadata !81, metadata !DIExpression()), !dbg !82
  store void (i64*)* @goodG2BSink, void (i64*)** %funcPtr, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !87
  store i64* %arraydecay, i64** %data, align 8, !dbg !88
  %0 = load void (i64*)*, void (i64*)** %funcPtr, align 8, !dbg !89
  %1 = load i64*, i64** %data, align 8, !dbg !90
  call void %0(i64* %1), !dbg !89
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i64* %data) #0 !dbg !92 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !95, metadata !DIExpression()), !dbg !97
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !97
  %1 = load i64*, i64** %data.addr, align 8, !dbg !98
  %2 = bitcast i64* %1 to i8*, !dbg !99
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !99
  %3 = bitcast i64* %arraydecay to i8*, !dbg !99
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %2, i8* align 16 %3, i64 800, i1 false), !dbg !99
  %4 = load i64*, i64** %data.addr, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 0, !dbg !100
  %5 = load i64, i64* %arrayidx, align 8, !dbg !100
  call void @printLongLongLine(i64 %5), !dbg !101
  ret void, !dbg !102
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_44.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_44_bad", scope: !12, file: !12, line: 31, type: !13, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_44.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 33, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !18, line: 27, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !20, line: 43, baseType: !21)
!20 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!21 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!22 = !DILocation(line: 33, column: 15, scope: !11)
!23 = !DILocalVariable(name: "funcPtr", scope: !11, file: !12, line: 35, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DISubroutineType(types: !26)
!26 = !{null, !16}
!27 = !DILocation(line: 35, column: 12, scope: !11)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 36, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 50)
!32 = !DILocation(line: 36, column: 13, scope: !11)
!33 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 37, type: !34)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 37, column: 13, scope: !11)
!38 = !DILocation(line: 40, column: 12, scope: !11)
!39 = !DILocation(line: 40, column: 10, scope: !11)
!40 = !DILocation(line: 42, column: 5, scope: !11)
!41 = !DILocation(line: 42, column: 13, scope: !11)
!42 = !DILocation(line: 43, column: 1, scope: !11)
!43 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 21, type: !25, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocalVariable(name: "data", arg: 1, scope: !43, file: !12, line: 21, type: !16)
!45 = !DILocation(line: 21, column: 31, scope: !43)
!46 = !DILocalVariable(name: "source", scope: !47, file: !12, line: 24, type: !34)
!47 = distinct !DILexicalBlock(scope: !43, file: !12, line: 23, column: 5)
!48 = !DILocation(line: 24, column: 17, scope: !47)
!49 = !DILocation(line: 26, column: 16, scope: !47)
!50 = !DILocation(line: 26, column: 9, scope: !47)
!51 = !DILocation(line: 27, column: 27, scope: !47)
!52 = !DILocation(line: 27, column: 9, scope: !47)
!53 = !DILocation(line: 29, column: 1, scope: !43)
!54 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_44_good", scope: !12, file: !12, line: 71, type: !13, scopeLine: 72, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 73, column: 5, scope: !54)
!56 = !DILocation(line: 74, column: 1, scope: !54)
!57 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 85, type: !58, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!60, !60, !61}
!60 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !12, line: 85, type: !60)
!65 = !DILocation(line: 85, column: 14, scope: !57)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !12, line: 85, type: !61)
!67 = !DILocation(line: 85, column: 27, scope: !57)
!68 = !DILocation(line: 88, column: 22, scope: !57)
!69 = !DILocation(line: 88, column: 12, scope: !57)
!70 = !DILocation(line: 88, column: 5, scope: !57)
!71 = !DILocation(line: 90, column: 5, scope: !57)
!72 = !DILocation(line: 91, column: 5, scope: !57)
!73 = !DILocation(line: 92, column: 5, scope: !57)
!74 = !DILocation(line: 95, column: 5, scope: !57)
!75 = !DILocation(line: 96, column: 5, scope: !57)
!76 = !DILocation(line: 97, column: 5, scope: !57)
!77 = !DILocation(line: 99, column: 5, scope: !57)
!78 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !12, line: 62, type: !16)
!80 = !DILocation(line: 62, column: 15, scope: !78)
!81 = !DILocalVariable(name: "funcPtr", scope: !78, file: !12, line: 63, type: !24)
!82 = !DILocation(line: 63, column: 12, scope: !78)
!83 = !DILocalVariable(name: "dataBadBuffer", scope: !78, file: !12, line: 64, type: !29)
!84 = !DILocation(line: 64, column: 13, scope: !78)
!85 = !DILocalVariable(name: "dataGoodBuffer", scope: !78, file: !12, line: 65, type: !34)
!86 = !DILocation(line: 65, column: 13, scope: !78)
!87 = !DILocation(line: 67, column: 12, scope: !78)
!88 = !DILocation(line: 67, column: 10, scope: !78)
!89 = !DILocation(line: 68, column: 5, scope: !78)
!90 = !DILocation(line: 68, column: 13, scope: !78)
!91 = !DILocation(line: 69, column: 1, scope: !78)
!92 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 50, type: !25, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "data", arg: 1, scope: !92, file: !12, line: 50, type: !16)
!94 = !DILocation(line: 50, column: 35, scope: !92)
!95 = !DILocalVariable(name: "source", scope: !96, file: !12, line: 53, type: !34)
!96 = distinct !DILexicalBlock(scope: !92, file: !12, line: 52, column: 5)
!97 = !DILocation(line: 53, column: 17, scope: !96)
!98 = !DILocation(line: 55, column: 16, scope: !96)
!99 = !DILocation(line: 55, column: 9, scope: !96)
!100 = !DILocation(line: 56, column: 27, scope: !96)
!101 = !DILocation(line: 56, column: 9, scope: !96)
!102 = !DILocation(line: 58, column: 1, scope: !92)
