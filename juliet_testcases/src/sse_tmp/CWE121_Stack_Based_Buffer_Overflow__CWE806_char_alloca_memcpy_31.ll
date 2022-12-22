; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_31_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  store i8* %1, i8** %data, align 8, !dbg !23
  %2 = load i8*, i8** %data, align 8, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !25
  %3 = load i8*, i8** %data, align 8, !dbg !26
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !26
  store i8 0, i8* %arrayidx, align 1, !dbg !27
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !28, metadata !DIExpression()), !dbg !30
  %4 = load i8*, i8** %data, align 8, !dbg !31
  store i8* %4, i8** %dataCopy, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !32, metadata !DIExpression()), !dbg !33
  %5 = load i8*, i8** %dataCopy, align 8, !dbg !34
  store i8* %5, i8** %data1, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !35, metadata !DIExpression()), !dbg !40
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !40
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !41
  %7 = load i8*, i8** %data1, align 8, !dbg !42
  %8 = load i8*, i8** %data1, align 8, !dbg !43
  %call = call i64 @strlen(i8* %8) #7, !dbg !44
  %mul = mul i64 %call, 1, !dbg !45
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %7, i64 %mul, i1 false), !dbg !41
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !46
  store i8 0, i8* %arrayidx2, align 1, !dbg !47
  %9 = load i8*, i8** %data1, align 8, !dbg !48
  call void @printLine(i8* %9), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_31_good() #0 !dbg !51 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #8, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #8, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_31_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_31_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !73 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %0 = alloca i8, i64 100, align 16, !dbg !78
  store i8* %0, i8** %dataBuffer, align 8, !dbg !77
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !79
  store i8* %1, i8** %data, align 8, !dbg !80
  %2 = load i8*, i8** %data, align 8, !dbg !81
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !82
  %3 = load i8*, i8** %data, align 8, !dbg !83
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !83
  store i8 0, i8* %arrayidx, align 1, !dbg !84
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !85, metadata !DIExpression()), !dbg !87
  %4 = load i8*, i8** %data, align 8, !dbg !88
  store i8* %4, i8** %dataCopy, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !89, metadata !DIExpression()), !dbg !90
  %5 = load i8*, i8** %dataCopy, align 8, !dbg !91
  store i8* %5, i8** %data1, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !92, metadata !DIExpression()), !dbg !94
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !94
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !95
  %7 = load i8*, i8** %data1, align 8, !dbg !96
  %8 = load i8*, i8** %data1, align 8, !dbg !97
  %call = call i64 @strlen(i8* %8) #7, !dbg !98
  %mul = mul i64 %call, 1, !dbg !99
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %7, i64 %mul, i1 false), !dbg !95
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !100
  store i8 0, i8* %arrayidx2, align 1, !dbg !101
  %9 = load i8*, i8** %data1, align 8, !dbg !102
  call void @printLine(i8* %9), !dbg !103
  ret void, !dbg !104
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_31.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_31_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_31.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 33, scope: !13)
!22 = !DILocation(line: 27, column: 12, scope: !13)
!23 = !DILocation(line: 27, column: 10, scope: !13)
!24 = !DILocation(line: 29, column: 12, scope: !13)
!25 = !DILocation(line: 29, column: 5, scope: !13)
!26 = !DILocation(line: 30, column: 5, scope: !13)
!27 = !DILocation(line: 30, column: 17, scope: !13)
!28 = !DILocalVariable(name: "dataCopy", scope: !29, file: !14, line: 32, type: !4)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 31, column: 5)
!30 = !DILocation(line: 32, column: 16, scope: !29)
!31 = !DILocation(line: 32, column: 27, scope: !29)
!32 = !DILocalVariable(name: "data", scope: !29, file: !14, line: 33, type: !4)
!33 = !DILocation(line: 33, column: 16, scope: !29)
!34 = !DILocation(line: 33, column: 23, scope: !29)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !14, line: 35, type: !37)
!36 = distinct !DILexicalBlock(scope: !29, file: !14, line: 34, column: 9)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 50)
!40 = !DILocation(line: 35, column: 18, scope: !36)
!41 = !DILocation(line: 37, column: 13, scope: !36)
!42 = !DILocation(line: 37, column: 26, scope: !36)
!43 = !DILocation(line: 37, column: 39, scope: !36)
!44 = !DILocation(line: 37, column: 32, scope: !36)
!45 = !DILocation(line: 37, column: 44, scope: !36)
!46 = !DILocation(line: 38, column: 13, scope: !36)
!47 = !DILocation(line: 38, column: 24, scope: !36)
!48 = !DILocation(line: 39, column: 23, scope: !36)
!49 = !DILocation(line: 39, column: 13, scope: !36)
!50 = !DILocation(line: 42, column: 1, scope: !13)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_31_good", scope: !14, file: !14, line: 70, type: !15, scopeLine: 71, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 72, column: 5, scope: !51)
!53 = !DILocation(line: 73, column: 1, scope: !51)
!54 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 84, type: !55, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !57, !58}
!57 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !14, line: 84, type: !57)
!60 = !DILocation(line: 84, column: 14, scope: !54)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !14, line: 84, type: !58)
!62 = !DILocation(line: 84, column: 27, scope: !54)
!63 = !DILocation(line: 87, column: 22, scope: !54)
!64 = !DILocation(line: 87, column: 12, scope: !54)
!65 = !DILocation(line: 87, column: 5, scope: !54)
!66 = !DILocation(line: 89, column: 5, scope: !54)
!67 = !DILocation(line: 90, column: 5, scope: !54)
!68 = !DILocation(line: 91, column: 5, scope: !54)
!69 = !DILocation(line: 94, column: 5, scope: !54)
!70 = !DILocation(line: 95, column: 5, scope: !54)
!71 = !DILocation(line: 96, column: 5, scope: !54)
!72 = !DILocation(line: 98, column: 5, scope: !54)
!73 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 49, type: !15, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !14, line: 51, type: !4)
!75 = !DILocation(line: 51, column: 12, scope: !73)
!76 = !DILocalVariable(name: "dataBuffer", scope: !73, file: !14, line: 52, type: !4)
!77 = !DILocation(line: 52, column: 12, scope: !73)
!78 = !DILocation(line: 52, column: 33, scope: !73)
!79 = !DILocation(line: 53, column: 12, scope: !73)
!80 = !DILocation(line: 53, column: 10, scope: !73)
!81 = !DILocation(line: 55, column: 12, scope: !73)
!82 = !DILocation(line: 55, column: 5, scope: !73)
!83 = !DILocation(line: 56, column: 5, scope: !73)
!84 = !DILocation(line: 56, column: 16, scope: !73)
!85 = !DILocalVariable(name: "dataCopy", scope: !86, file: !14, line: 58, type: !4)
!86 = distinct !DILexicalBlock(scope: !73, file: !14, line: 57, column: 5)
!87 = !DILocation(line: 58, column: 16, scope: !86)
!88 = !DILocation(line: 58, column: 27, scope: !86)
!89 = !DILocalVariable(name: "data", scope: !86, file: !14, line: 59, type: !4)
!90 = !DILocation(line: 59, column: 16, scope: !86)
!91 = !DILocation(line: 59, column: 23, scope: !86)
!92 = !DILocalVariable(name: "dest", scope: !93, file: !14, line: 61, type: !37)
!93 = distinct !DILexicalBlock(scope: !86, file: !14, line: 60, column: 9)
!94 = !DILocation(line: 61, column: 18, scope: !93)
!95 = !DILocation(line: 63, column: 13, scope: !93)
!96 = !DILocation(line: 63, column: 26, scope: !93)
!97 = !DILocation(line: 63, column: 39, scope: !93)
!98 = !DILocation(line: 63, column: 32, scope: !93)
!99 = !DILocation(line: 63, column: 44, scope: !93)
!100 = !DILocation(line: 64, column: 13, scope: !93)
!101 = !DILocation(line: 64, column: 24, scope: !93)
!102 = !DILocation(line: 65, column: 23, scope: !93)
!103 = !DILocation(line: 65, column: 13, scope: !93)
!104 = !DILocation(line: 68, column: 1, scope: !73)
