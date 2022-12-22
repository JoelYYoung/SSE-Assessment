; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_31_bad() #0 !dbg !13 {
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
  %call = call i64 @strlen(i8* %7) #6, !dbg !43
  %8 = load i8*, i8** %data1, align 8, !dbg !44
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %8) #7, !dbg !45
  %9 = load i8*, i8** %data1, align 8, !dbg !46
  call void @printLine(i8* %9), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_31_good() #0 !dbg !49 {
entry:
  call void @goodG2B(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* null) #7, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #7, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_31_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_31_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !71 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  %0 = alloca i8, i64 100, align 16, !dbg !76
  store i8* %0, i8** %dataBuffer, align 8, !dbg !75
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !77
  store i8* %1, i8** %data, align 8, !dbg !78
  %2 = load i8*, i8** %data, align 8, !dbg !79
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !80
  %3 = load i8*, i8** %data, align 8, !dbg !81
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !81
  store i8 0, i8* %arrayidx, align 1, !dbg !82
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !83, metadata !DIExpression()), !dbg !85
  %4 = load i8*, i8** %data, align 8, !dbg !86
  store i8* %4, i8** %dataCopy, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !87, metadata !DIExpression()), !dbg !88
  %5 = load i8*, i8** %dataCopy, align 8, !dbg !89
  store i8* %5, i8** %data1, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !90, metadata !DIExpression()), !dbg !92
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !92
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !93
  %7 = load i8*, i8** %data1, align 8, !dbg !94
  %call = call i64 @strlen(i8* %7) #6, !dbg !95
  %8 = load i8*, i8** %data1, align 8, !dbg !96
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %8) #7, !dbg !97
  %9 = load i8*, i8** %data1, align 8, !dbg !98
  call void @printLine(i8* %9), !dbg !99
  ret void, !dbg !100
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_31.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_31_bad", scope: !14, file: !14, line: 29, type: !15, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_31.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 31, type: !4)
!18 = !DILocation(line: 31, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 32, type: !4)
!20 = !DILocation(line: 32, column: 12, scope: !13)
!21 = !DILocation(line: 32, column: 33, scope: !13)
!22 = !DILocation(line: 33, column: 12, scope: !13)
!23 = !DILocation(line: 33, column: 10, scope: !13)
!24 = !DILocation(line: 35, column: 12, scope: !13)
!25 = !DILocation(line: 35, column: 5, scope: !13)
!26 = !DILocation(line: 36, column: 5, scope: !13)
!27 = !DILocation(line: 36, column: 17, scope: !13)
!28 = !DILocalVariable(name: "dataCopy", scope: !29, file: !14, line: 38, type: !4)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 37, column: 5)
!30 = !DILocation(line: 38, column: 16, scope: !29)
!31 = !DILocation(line: 38, column: 27, scope: !29)
!32 = !DILocalVariable(name: "data", scope: !29, file: !14, line: 39, type: !4)
!33 = !DILocation(line: 39, column: 16, scope: !29)
!34 = !DILocation(line: 39, column: 23, scope: !29)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !14, line: 41, type: !37)
!36 = distinct !DILexicalBlock(scope: !29, file: !14, line: 40, column: 9)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 50)
!40 = !DILocation(line: 41, column: 18, scope: !36)
!41 = !DILocation(line: 43, column: 22, scope: !36)
!42 = !DILocation(line: 43, column: 35, scope: !36)
!43 = !DILocation(line: 43, column: 28, scope: !36)
!44 = !DILocation(line: 43, column: 48, scope: !36)
!45 = !DILocation(line: 43, column: 13, scope: !36)
!46 = !DILocation(line: 44, column: 23, scope: !36)
!47 = !DILocation(line: 44, column: 13, scope: !36)
!48 = !DILocation(line: 47, column: 1, scope: !13)
!49 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_31_good", scope: !14, file: !14, line: 74, type: !15, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 76, column: 5, scope: !49)
!51 = !DILocation(line: 77, column: 1, scope: !49)
!52 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 88, type: !53, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!55, !55, !56}
!55 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !14, line: 88, type: !55)
!58 = !DILocation(line: 88, column: 14, scope: !52)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !14, line: 88, type: !56)
!60 = !DILocation(line: 88, column: 27, scope: !52)
!61 = !DILocation(line: 91, column: 22, scope: !52)
!62 = !DILocation(line: 91, column: 12, scope: !52)
!63 = !DILocation(line: 91, column: 5, scope: !52)
!64 = !DILocation(line: 93, column: 5, scope: !52)
!65 = !DILocation(line: 94, column: 5, scope: !52)
!66 = !DILocation(line: 95, column: 5, scope: !52)
!67 = !DILocation(line: 98, column: 5, scope: !52)
!68 = !DILocation(line: 99, column: 5, scope: !52)
!69 = !DILocation(line: 100, column: 5, scope: !52)
!70 = !DILocation(line: 102, column: 5, scope: !52)
!71 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 54, type: !15, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "data", scope: !71, file: !14, line: 56, type: !4)
!73 = !DILocation(line: 56, column: 12, scope: !71)
!74 = !DILocalVariable(name: "dataBuffer", scope: !71, file: !14, line: 57, type: !4)
!75 = !DILocation(line: 57, column: 12, scope: !71)
!76 = !DILocation(line: 57, column: 33, scope: !71)
!77 = !DILocation(line: 58, column: 12, scope: !71)
!78 = !DILocation(line: 58, column: 10, scope: !71)
!79 = !DILocation(line: 60, column: 12, scope: !71)
!80 = !DILocation(line: 60, column: 5, scope: !71)
!81 = !DILocation(line: 61, column: 5, scope: !71)
!82 = !DILocation(line: 61, column: 16, scope: !71)
!83 = !DILocalVariable(name: "dataCopy", scope: !84, file: !14, line: 63, type: !4)
!84 = distinct !DILexicalBlock(scope: !71, file: !14, line: 62, column: 5)
!85 = !DILocation(line: 63, column: 16, scope: !84)
!86 = !DILocation(line: 63, column: 27, scope: !84)
!87 = !DILocalVariable(name: "data", scope: !84, file: !14, line: 64, type: !4)
!88 = !DILocation(line: 64, column: 16, scope: !84)
!89 = !DILocation(line: 64, column: 23, scope: !84)
!90 = !DILocalVariable(name: "dest", scope: !91, file: !14, line: 66, type: !37)
!91 = distinct !DILexicalBlock(scope: !84, file: !14, line: 65, column: 9)
!92 = !DILocation(line: 66, column: 18, scope: !91)
!93 = !DILocation(line: 68, column: 22, scope: !91)
!94 = !DILocation(line: 68, column: 35, scope: !91)
!95 = !DILocation(line: 68, column: 28, scope: !91)
!96 = !DILocation(line: 68, column: 48, scope: !91)
!97 = !DILocation(line: 68, column: 13, scope: !91)
!98 = !DILocation(line: 69, column: 23, scope: !91)
!99 = !DILocation(line: 69, column: 13, scope: !91)
!100 = !DILocation(line: 72, column: 1, scope: !71)
