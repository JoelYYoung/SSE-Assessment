; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_12_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_12_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !29
  %tobool = icmp ne i32 %call, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.else, !dbg !31

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !32
  store i8* %arraydecay, i8** %data, align 8, !dbg !34
  %0 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  br label %if.end, !dbg !37

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !38
  store i8* %arraydecay1, i8** %data, align 8, !dbg !40
  %1 = load i8*, i8** %data, align 8, !dbg !41
  %arrayidx2 = getelementptr inbounds i8, i8* %1, i64 0, !dbg !41
  store i8 0, i8* %arrayidx2, align 1, !dbg !42
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !43, metadata !DIExpression()), !dbg !45
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !45
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_12_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !45
  %3 = load i8*, i8** %data, align 8, !dbg !46
  %arraydecay3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !47
  %call4 = call i8* @strcpy(i8* %3, i8* %arraydecay3) #5, !dbg !48
  %4 = load i8*, i8** %data, align 8, !dbg !49
  call void @printLine(i8* %4), !dbg !50
  ret void, !dbg !51
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_12_good() #0 !dbg !52 {
entry:
  call void @goodG2B(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #5, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #5, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_12_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_12_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !74 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !81
  %tobool = icmp ne i32 %call, 0, !dbg !81
  br i1 %tobool, label %if.then, label %if.else, !dbg !83

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !84
  store i8* %arraydecay, i8** %data, align 8, !dbg !86
  %0 = load i8*, i8** %data, align 8, !dbg !87
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !87
  store i8 0, i8* %arrayidx, align 1, !dbg !88
  br label %if.end, !dbg !89

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !90
  store i8* %arraydecay1, i8** %data, align 8, !dbg !92
  %1 = load i8*, i8** %data, align 8, !dbg !93
  %arrayidx2 = getelementptr inbounds i8, i8* %1, i64 0, !dbg !93
  store i8 0, i8* %arrayidx2, align 1, !dbg !94
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !95, metadata !DIExpression()), !dbg !97
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !97
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !97
  %3 = load i8*, i8** %data, align 8, !dbg !98
  %arraydecay3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !99
  %call4 = call i8* @strcpy(i8* %3, i8* %arraydecay3) #5, !dbg !100
  %4 = load i8*, i8** %data, align 8, !dbg !101
  call void @printLine(i8* %4), !dbg !102
  ret void, !dbg !103
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_12.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_12_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_12.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 30, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 80, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 10)
!23 = !DILocation(line: 31, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 88, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 11)
!28 = !DILocation(line: 32, column: 10, scope: !11)
!29 = !DILocation(line: 33, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 8)
!31 = !DILocation(line: 33, column: 8, scope: !11)
!32 = !DILocation(line: 37, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !12, line: 34, column: 5)
!34 = !DILocation(line: 37, column: 14, scope: !33)
!35 = !DILocation(line: 38, column: 9, scope: !33)
!36 = !DILocation(line: 38, column: 17, scope: !33)
!37 = !DILocation(line: 39, column: 5, scope: !33)
!38 = !DILocation(line: 44, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !30, file: !12, line: 41, column: 5)
!40 = !DILocation(line: 44, column: 14, scope: !39)
!41 = !DILocation(line: 45, column: 9, scope: !39)
!42 = !DILocation(line: 45, column: 17, scope: !39)
!43 = !DILocalVariable(name: "source", scope: !44, file: !12, line: 48, type: !25)
!44 = distinct !DILexicalBlock(scope: !11, file: !12, line: 47, column: 5)
!45 = !DILocation(line: 48, column: 14, scope: !44)
!46 = !DILocation(line: 50, column: 16, scope: !44)
!47 = !DILocation(line: 50, column: 22, scope: !44)
!48 = !DILocation(line: 50, column: 9, scope: !44)
!49 = !DILocation(line: 51, column: 19, scope: !44)
!50 = !DILocation(line: 51, column: 9, scope: !44)
!51 = !DILocation(line: 53, column: 1, scope: !11)
!52 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_12_good", scope: !12, file: !12, line: 88, type: !13, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 90, column: 5, scope: !52)
!54 = !DILocation(line: 91, column: 1, scope: !52)
!55 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 103, type: !56, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!58, !58, !59}
!58 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !12, line: 103, type: !58)
!61 = !DILocation(line: 103, column: 14, scope: !55)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !12, line: 103, type: !59)
!63 = !DILocation(line: 103, column: 27, scope: !55)
!64 = !DILocation(line: 106, column: 22, scope: !55)
!65 = !DILocation(line: 106, column: 12, scope: !55)
!66 = !DILocation(line: 106, column: 5, scope: !55)
!67 = !DILocation(line: 108, column: 5, scope: !55)
!68 = !DILocation(line: 109, column: 5, scope: !55)
!69 = !DILocation(line: 110, column: 5, scope: !55)
!70 = !DILocation(line: 113, column: 5, scope: !55)
!71 = !DILocation(line: 114, column: 5, scope: !55)
!72 = !DILocation(line: 115, column: 5, scope: !55)
!73 = !DILocation(line: 117, column: 5, scope: !55)
!74 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !12, line: 63, type: !16)
!76 = !DILocation(line: 63, column: 12, scope: !74)
!77 = !DILocalVariable(name: "dataBadBuffer", scope: !74, file: !12, line: 64, type: !20)
!78 = !DILocation(line: 64, column: 10, scope: !74)
!79 = !DILocalVariable(name: "dataGoodBuffer", scope: !74, file: !12, line: 65, type: !25)
!80 = !DILocation(line: 65, column: 10, scope: !74)
!81 = !DILocation(line: 66, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !74, file: !12, line: 66, column: 8)
!83 = !DILocation(line: 66, column: 8, scope: !74)
!84 = !DILocation(line: 70, column: 16, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !12, line: 67, column: 5)
!86 = !DILocation(line: 70, column: 14, scope: !85)
!87 = !DILocation(line: 71, column: 9, scope: !85)
!88 = !DILocation(line: 71, column: 17, scope: !85)
!89 = !DILocation(line: 72, column: 5, scope: !85)
!90 = !DILocation(line: 77, column: 16, scope: !91)
!91 = distinct !DILexicalBlock(scope: !82, file: !12, line: 74, column: 5)
!92 = !DILocation(line: 77, column: 14, scope: !91)
!93 = !DILocation(line: 78, column: 9, scope: !91)
!94 = !DILocation(line: 78, column: 17, scope: !91)
!95 = !DILocalVariable(name: "source", scope: !96, file: !12, line: 81, type: !25)
!96 = distinct !DILexicalBlock(scope: !74, file: !12, line: 80, column: 5)
!97 = !DILocation(line: 81, column: 14, scope: !96)
!98 = !DILocation(line: 83, column: 16, scope: !96)
!99 = !DILocation(line: 83, column: 22, scope: !96)
!100 = !DILocation(line: 83, column: 9, scope: !96)
!101 = !DILocation(line: 84, column: 19, scope: !96)
!102 = !DILocation(line: 84, column: 9, scope: !96)
!103 = !DILocation(line: 86, column: 1, scope: !74)
