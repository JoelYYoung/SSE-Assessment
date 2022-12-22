; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_12_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 50, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 100, align 16, !dbg !24
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !23
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !25
  %tobool = icmp ne i32 %call, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.else, !dbg !27

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !28
  store i8* %2, i8** %data, align 8, !dbg !30
  %3 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  br label %if.end, !dbg !33

if.else:                                          ; preds = %entry
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !34
  store i8* %4, i8** %data, align 8, !dbg !36
  %5 = load i8*, i8** %data, align 8, !dbg !37
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 0, !dbg !37
  store i8 0, i8* %arrayidx1, align 1, !dbg !38
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !45
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !46
  store i8 0, i8* %arrayidx2, align 1, !dbg !47
  %6 = load i8*, i8** %data, align 8, !dbg !48
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !49
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* align 16 %arraydecay3, i64 100, i1 false), !dbg !49
  %7 = load i8*, i8** %data, align 8, !dbg !50
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !50
  store i8 0, i8* %arrayidx4, align 1, !dbg !51
  %8 = load i8*, i8** %data, align 8, !dbg !52
  call void @printLine(i8* %8), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_12_good() #0 !dbg !55 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #6, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #6, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_12_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_12_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !77 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %0 = alloca i8, i64 50, align 16, !dbg !82
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %1 = alloca i8, i64 100, align 16, !dbg !85
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !84
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !86
  %tobool = icmp ne i32 %call, 0, !dbg !86
  br i1 %tobool, label %if.then, label %if.else, !dbg !88

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !89
  store i8* %2, i8** %data, align 8, !dbg !91
  %3 = load i8*, i8** %data, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !92
  store i8 0, i8* %arrayidx, align 1, !dbg !93
  br label %if.end, !dbg !94

if.else:                                          ; preds = %entry
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !95
  store i8* %4, i8** %data, align 8, !dbg !97
  %5 = load i8*, i8** %data, align 8, !dbg !98
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 0, !dbg !98
  store i8 0, i8* %arrayidx1, align 1, !dbg !99
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !100, metadata !DIExpression()), !dbg !102
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !103
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !104
  store i8 0, i8* %arrayidx2, align 1, !dbg !105
  %6 = load i8*, i8** %data, align 8, !dbg !106
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !107
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* align 16 %arraydecay3, i64 100, i1 false), !dbg !107
  %7 = load i8*, i8** %data, align 8, !dbg !108
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !108
  store i8 0, i8* %arrayidx4, align 1, !dbg !109
  %8 = load i8*, i8** %data, align 8, !dbg !110
  call void @printLine(i8* %8), !dbg !111
  ret void, !dbg !112
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_12.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_12_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_12.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 27, type: !4)
!23 = !DILocation(line: 27, column: 12, scope: !13)
!24 = !DILocation(line: 27, column: 37, scope: !13)
!25 = !DILocation(line: 28, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !13, file: !14, line: 28, column: 8)
!27 = !DILocation(line: 28, column: 8, scope: !13)
!28 = !DILocation(line: 32, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !14, line: 29, column: 5)
!30 = !DILocation(line: 32, column: 14, scope: !29)
!31 = !DILocation(line: 33, column: 9, scope: !29)
!32 = !DILocation(line: 33, column: 17, scope: !29)
!33 = !DILocation(line: 34, column: 5, scope: !29)
!34 = !DILocation(line: 38, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !26, file: !14, line: 36, column: 5)
!36 = !DILocation(line: 38, column: 14, scope: !35)
!37 = !DILocation(line: 39, column: 9, scope: !35)
!38 = !DILocation(line: 39, column: 17, scope: !35)
!39 = !DILocalVariable(name: "source", scope: !40, file: !14, line: 42, type: !41)
!40 = distinct !DILexicalBlock(scope: !13, file: !14, line: 41, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 42, column: 14, scope: !40)
!45 = !DILocation(line: 43, column: 9, scope: !40)
!46 = !DILocation(line: 44, column: 9, scope: !40)
!47 = !DILocation(line: 44, column: 23, scope: !40)
!48 = !DILocation(line: 46, column: 16, scope: !40)
!49 = !DILocation(line: 46, column: 9, scope: !40)
!50 = !DILocation(line: 47, column: 9, scope: !40)
!51 = !DILocation(line: 47, column: 21, scope: !40)
!52 = !DILocation(line: 48, column: 19, scope: !40)
!53 = !DILocation(line: 48, column: 9, scope: !40)
!54 = !DILocation(line: 50, column: 1, scope: !13)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_12_good", scope: !14, file: !14, line: 86, type: !15, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 88, column: 5, scope: !55)
!57 = !DILocation(line: 89, column: 1, scope: !55)
!58 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 101, type: !59, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!61, !61, !62}
!61 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !14, line: 101, type: !61)
!64 = !DILocation(line: 101, column: 14, scope: !58)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !14, line: 101, type: !62)
!66 = !DILocation(line: 101, column: 27, scope: !58)
!67 = !DILocation(line: 104, column: 22, scope: !58)
!68 = !DILocation(line: 104, column: 12, scope: !58)
!69 = !DILocation(line: 104, column: 5, scope: !58)
!70 = !DILocation(line: 106, column: 5, scope: !58)
!71 = !DILocation(line: 107, column: 5, scope: !58)
!72 = !DILocation(line: 108, column: 5, scope: !58)
!73 = !DILocation(line: 111, column: 5, scope: !58)
!74 = !DILocation(line: 112, column: 5, scope: !58)
!75 = !DILocation(line: 113, column: 5, scope: !58)
!76 = !DILocation(line: 115, column: 5, scope: !58)
!77 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 58, type: !15, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !14, line: 60, type: !4)
!79 = !DILocation(line: 60, column: 12, scope: !77)
!80 = !DILocalVariable(name: "dataBadBuffer", scope: !77, file: !14, line: 61, type: !4)
!81 = !DILocation(line: 61, column: 12, scope: !77)
!82 = !DILocation(line: 61, column: 36, scope: !77)
!83 = !DILocalVariable(name: "dataGoodBuffer", scope: !77, file: !14, line: 62, type: !4)
!84 = !DILocation(line: 62, column: 12, scope: !77)
!85 = !DILocation(line: 62, column: 37, scope: !77)
!86 = !DILocation(line: 63, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !77, file: !14, line: 63, column: 8)
!88 = !DILocation(line: 63, column: 8, scope: !77)
!89 = !DILocation(line: 66, column: 16, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !14, line: 64, column: 5)
!91 = !DILocation(line: 66, column: 14, scope: !90)
!92 = !DILocation(line: 67, column: 9, scope: !90)
!93 = !DILocation(line: 67, column: 17, scope: !90)
!94 = !DILocation(line: 68, column: 5, scope: !90)
!95 = !DILocation(line: 72, column: 16, scope: !96)
!96 = distinct !DILexicalBlock(scope: !87, file: !14, line: 70, column: 5)
!97 = !DILocation(line: 72, column: 14, scope: !96)
!98 = !DILocation(line: 73, column: 9, scope: !96)
!99 = !DILocation(line: 73, column: 17, scope: !96)
!100 = !DILocalVariable(name: "source", scope: !101, file: !14, line: 76, type: !41)
!101 = distinct !DILexicalBlock(scope: !77, file: !14, line: 75, column: 5)
!102 = !DILocation(line: 76, column: 14, scope: !101)
!103 = !DILocation(line: 77, column: 9, scope: !101)
!104 = !DILocation(line: 78, column: 9, scope: !101)
!105 = !DILocation(line: 78, column: 23, scope: !101)
!106 = !DILocation(line: 80, column: 16, scope: !101)
!107 = !DILocation(line: 80, column: 9, scope: !101)
!108 = !DILocation(line: 81, column: 9, scope: !101)
!109 = !DILocation(line: 81, column: 21, scope: !101)
!110 = !DILocation(line: 82, column: 19, scope: !101)
!111 = !DILocation(line: 82, column: 9, scope: !101)
!112 = !DILocation(line: 84, column: 1, scope: !77)
