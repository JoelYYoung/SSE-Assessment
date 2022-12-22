; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_12_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_12_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 10, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 11, align 16, !dbg !24
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
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %6 = bitcast [11 x i8]* %source to i8*, !dbg !44
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_12_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !44
  %7 = load i8*, i8** %data, align 8, !dbg !45
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !46
  %call2 = call i8* @strcpy(i8* %7, i8* %arraydecay) #5, !dbg !47
  %8 = load i8*, i8** %data, align 8, !dbg !48
  call void @printLine(i8* %8), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_12_good() #0 !dbg !51 {
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
  %call = call i64 @time(i64* null) #5, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #5, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_12_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_12_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !73 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %0 = alloca i8, i64 10, align 16, !dbg !78
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !77
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %1 = alloca i8, i64 11, align 16, !dbg !81
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !80
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !82
  %tobool = icmp ne i32 %call, 0, !dbg !82
  br i1 %tobool, label %if.then, label %if.else, !dbg !84

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !85
  store i8* %2, i8** %data, align 8, !dbg !87
  %3 = load i8*, i8** %data, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !88
  store i8 0, i8* %arrayidx, align 1, !dbg !89
  br label %if.end, !dbg !90

if.else:                                          ; preds = %entry
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !91
  store i8* %4, i8** %data, align 8, !dbg !93
  %5 = load i8*, i8** %data, align 8, !dbg !94
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 0, !dbg !94
  store i8 0, i8* %arrayidx1, align 1, !dbg !95
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !96, metadata !DIExpression()), !dbg !98
  %6 = bitcast [11 x i8]* %source to i8*, !dbg !98
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !98
  %7 = load i8*, i8** %data, align 8, !dbg !99
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !100
  %call2 = call i8* @strcpy(i8* %7, i8* %arraydecay) #5, !dbg !101
  %8 = load i8*, i8** %data, align 8, !dbg !102
  call void @printLine(i8* %8), !dbg !103
  ret void, !dbg !104
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_12.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_12_bad", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_12.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 30, type: !4)
!18 = !DILocation(line: 30, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 31, type: !4)
!20 = !DILocation(line: 31, column: 12, scope: !13)
!21 = !DILocation(line: 31, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 32, type: !4)
!23 = !DILocation(line: 32, column: 12, scope: !13)
!24 = !DILocation(line: 32, column: 37, scope: !13)
!25 = !DILocation(line: 33, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !13, file: !14, line: 33, column: 8)
!27 = !DILocation(line: 33, column: 8, scope: !13)
!28 = !DILocation(line: 37, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !14, line: 34, column: 5)
!30 = !DILocation(line: 37, column: 14, scope: !29)
!31 = !DILocation(line: 38, column: 9, scope: !29)
!32 = !DILocation(line: 38, column: 17, scope: !29)
!33 = !DILocation(line: 39, column: 5, scope: !29)
!34 = !DILocation(line: 44, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !26, file: !14, line: 41, column: 5)
!36 = !DILocation(line: 44, column: 14, scope: !35)
!37 = !DILocation(line: 45, column: 9, scope: !35)
!38 = !DILocation(line: 45, column: 17, scope: !35)
!39 = !DILocalVariable(name: "source", scope: !40, file: !14, line: 48, type: !41)
!40 = distinct !DILexicalBlock(scope: !13, file: !14, line: 47, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 11)
!44 = !DILocation(line: 48, column: 14, scope: !40)
!45 = !DILocation(line: 50, column: 16, scope: !40)
!46 = !DILocation(line: 50, column: 22, scope: !40)
!47 = !DILocation(line: 50, column: 9, scope: !40)
!48 = !DILocation(line: 51, column: 19, scope: !40)
!49 = !DILocation(line: 51, column: 9, scope: !40)
!50 = !DILocation(line: 53, column: 1, scope: !13)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_12_good", scope: !14, file: !14, line: 88, type: !15, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 90, column: 5, scope: !51)
!53 = !DILocation(line: 91, column: 1, scope: !51)
!54 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 103, type: !55, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !57, !58}
!57 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !14, line: 103, type: !57)
!60 = !DILocation(line: 103, column: 14, scope: !54)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !14, line: 103, type: !58)
!62 = !DILocation(line: 103, column: 27, scope: !54)
!63 = !DILocation(line: 106, column: 22, scope: !54)
!64 = !DILocation(line: 106, column: 12, scope: !54)
!65 = !DILocation(line: 106, column: 5, scope: !54)
!66 = !DILocation(line: 108, column: 5, scope: !54)
!67 = !DILocation(line: 109, column: 5, scope: !54)
!68 = !DILocation(line: 110, column: 5, scope: !54)
!69 = !DILocation(line: 113, column: 5, scope: !54)
!70 = !DILocation(line: 114, column: 5, scope: !54)
!71 = !DILocation(line: 115, column: 5, scope: !54)
!72 = !DILocation(line: 117, column: 5, scope: !54)
!73 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 61, type: !15, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !14, line: 63, type: !4)
!75 = !DILocation(line: 63, column: 12, scope: !73)
!76 = !DILocalVariable(name: "dataBadBuffer", scope: !73, file: !14, line: 64, type: !4)
!77 = !DILocation(line: 64, column: 12, scope: !73)
!78 = !DILocation(line: 64, column: 36, scope: !73)
!79 = !DILocalVariable(name: "dataGoodBuffer", scope: !73, file: !14, line: 65, type: !4)
!80 = !DILocation(line: 65, column: 12, scope: !73)
!81 = !DILocation(line: 65, column: 37, scope: !73)
!82 = !DILocation(line: 66, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !73, file: !14, line: 66, column: 8)
!84 = !DILocation(line: 66, column: 8, scope: !73)
!85 = !DILocation(line: 70, column: 16, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !14, line: 67, column: 5)
!87 = !DILocation(line: 70, column: 14, scope: !86)
!88 = !DILocation(line: 71, column: 9, scope: !86)
!89 = !DILocation(line: 71, column: 17, scope: !86)
!90 = !DILocation(line: 72, column: 5, scope: !86)
!91 = !DILocation(line: 77, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !83, file: !14, line: 74, column: 5)
!93 = !DILocation(line: 77, column: 14, scope: !92)
!94 = !DILocation(line: 78, column: 9, scope: !92)
!95 = !DILocation(line: 78, column: 17, scope: !92)
!96 = !DILocalVariable(name: "source", scope: !97, file: !14, line: 81, type: !41)
!97 = distinct !DILexicalBlock(scope: !73, file: !14, line: 80, column: 5)
!98 = !DILocation(line: 81, column: 14, scope: !97)
!99 = !DILocation(line: 83, column: 16, scope: !97)
!100 = !DILocation(line: 83, column: 22, scope: !97)
!101 = !DILocation(line: 83, column: 9, scope: !97)
!102 = !DILocation(line: 84, column: 19, scope: !97)
!103 = !DILocation(line: 84, column: 9, scope: !97)
!104 = !DILocation(line: 86, column: 1, scope: !73)
