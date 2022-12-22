; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %dataCopy = alloca i64*, align 8
  %data1 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !15, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !33
  store i64* %arraydecay, i64** %data, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i64** %dataCopy, metadata !35, metadata !DIExpression()), !dbg !37
  %0 = load i64*, i64** %data, align 8, !dbg !38
  store i64* %0, i64** %dataCopy, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !39, metadata !DIExpression()), !dbg !40
  %1 = load i64*, i64** %dataCopy, align 8, !dbg !41
  store i64* %1, i64** %data1, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !42, metadata !DIExpression()), !dbg !44
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !44
  %3 = load i64*, i64** %data1, align 8, !dbg !45
  %4 = bitcast i64* %3 to i8*, !dbg !46
  %arraydecay2 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !46
  %5 = bitcast i64* %arraydecay2 to i8*, !dbg !46
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %4, i8* align 16 %5, i64 800, i1 false), !dbg !46
  %6 = load i64*, i64** %data1, align 8, !dbg !47
  %arrayidx = getelementptr inbounds i64, i64* %6, i64 0, !dbg !47
  %7 = load i64, i64* %arrayidx, align 8, !dbg !47
  call void @printLongLongLine(i64 %7), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_31_good() #0 !dbg !50 {
entry:
  call void @goodG2B(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #6, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #6, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_31_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_31_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !74 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %dataCopy = alloca i64*, align 8
  %data1 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !81
  store i64* %arraydecay, i64** %data, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata i64** %dataCopy, metadata !83, metadata !DIExpression()), !dbg !85
  %0 = load i64*, i64** %data, align 8, !dbg !86
  store i64* %0, i64** %dataCopy, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !87, metadata !DIExpression()), !dbg !88
  %1 = load i64*, i64** %dataCopy, align 8, !dbg !89
  store i64* %1, i64** %data1, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !90, metadata !DIExpression()), !dbg !92
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !92
  %3 = load i64*, i64** %data1, align 8, !dbg !93
  %4 = bitcast i64* %3 to i8*, !dbg !94
  %arraydecay2 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !94
  %5 = bitcast i64* %arraydecay2 to i8*, !dbg !94
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %4, i8* align 16 %5, i64 800, i1 false), !dbg !94
  %6 = load i64*, i64** %data1, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i64, i64* %6, i64 0, !dbg !95
  %7 = load i64, i64* %arrayidx, align 8, !dbg !95
  call void @printLongLongLine(i64 %7), !dbg !96
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_31.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_31_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_31.c", directory: "/root/SSE-Assessment")
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
!33 = !DILocation(line: 28, column: 12, scope: !11)
!34 = !DILocation(line: 28, column: 10, scope: !11)
!35 = !DILocalVariable(name: "dataCopy", scope: !36, file: !12, line: 30, type: !16)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!37 = !DILocation(line: 30, column: 19, scope: !36)
!38 = !DILocation(line: 30, column: 30, scope: !36)
!39 = !DILocalVariable(name: "data", scope: !36, file: !12, line: 31, type: !16)
!40 = !DILocation(line: 31, column: 19, scope: !36)
!41 = !DILocation(line: 31, column: 26, scope: !36)
!42 = !DILocalVariable(name: "source", scope: !43, file: !12, line: 33, type: !29)
!43 = distinct !DILexicalBlock(scope: !36, file: !12, line: 32, column: 9)
!44 = !DILocation(line: 33, column: 21, scope: !43)
!45 = !DILocation(line: 35, column: 20, scope: !43)
!46 = !DILocation(line: 35, column: 13, scope: !43)
!47 = !DILocation(line: 36, column: 31, scope: !43)
!48 = !DILocation(line: 36, column: 13, scope: !43)
!49 = !DILocation(line: 39, column: 1, scope: !11)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_31_good", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 67, column: 5, scope: !50)
!52 = !DILocation(line: 68, column: 1, scope: !50)
!53 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 79, type: !54, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!56, !56, !57}
!56 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !12, line: 79, type: !56)
!61 = !DILocation(line: 79, column: 14, scope: !53)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !12, line: 79, type: !57)
!63 = !DILocation(line: 79, column: 27, scope: !53)
!64 = !DILocation(line: 82, column: 22, scope: !53)
!65 = !DILocation(line: 82, column: 12, scope: !53)
!66 = !DILocation(line: 82, column: 5, scope: !53)
!67 = !DILocation(line: 84, column: 5, scope: !53)
!68 = !DILocation(line: 85, column: 5, scope: !53)
!69 = !DILocation(line: 86, column: 5, scope: !53)
!70 = !DILocation(line: 89, column: 5, scope: !53)
!71 = !DILocation(line: 90, column: 5, scope: !53)
!72 = !DILocation(line: 91, column: 5, scope: !53)
!73 = !DILocation(line: 93, column: 5, scope: !53)
!74 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 46, type: !13, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !12, line: 48, type: !16)
!76 = !DILocation(line: 48, column: 15, scope: !74)
!77 = !DILocalVariable(name: "dataBadBuffer", scope: !74, file: !12, line: 49, type: !24)
!78 = !DILocation(line: 49, column: 13, scope: !74)
!79 = !DILocalVariable(name: "dataGoodBuffer", scope: !74, file: !12, line: 50, type: !29)
!80 = !DILocation(line: 50, column: 13, scope: !74)
!81 = !DILocation(line: 52, column: 12, scope: !74)
!82 = !DILocation(line: 52, column: 10, scope: !74)
!83 = !DILocalVariable(name: "dataCopy", scope: !84, file: !12, line: 54, type: !16)
!84 = distinct !DILexicalBlock(scope: !74, file: !12, line: 53, column: 5)
!85 = !DILocation(line: 54, column: 19, scope: !84)
!86 = !DILocation(line: 54, column: 30, scope: !84)
!87 = !DILocalVariable(name: "data", scope: !84, file: !12, line: 55, type: !16)
!88 = !DILocation(line: 55, column: 19, scope: !84)
!89 = !DILocation(line: 55, column: 26, scope: !84)
!90 = !DILocalVariable(name: "source", scope: !91, file: !12, line: 57, type: !29)
!91 = distinct !DILexicalBlock(scope: !84, file: !12, line: 56, column: 9)
!92 = !DILocation(line: 57, column: 21, scope: !91)
!93 = !DILocation(line: 59, column: 20, scope: !91)
!94 = !DILocation(line: 59, column: 13, scope: !91)
!95 = !DILocation(line: 60, column: 31, scope: !91)
!96 = !DILocation(line: 60, column: 13, scope: !91)
!97 = !DILocation(line: 63, column: 1, scope: !74)
