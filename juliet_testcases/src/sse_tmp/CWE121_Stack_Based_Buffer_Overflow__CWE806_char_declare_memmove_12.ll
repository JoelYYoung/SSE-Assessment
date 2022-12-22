; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_12_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  store i8* %arraydecay, i8** %data, align 8, !dbg !25
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !26
  %tobool = icmp ne i32 %call, 0, !dbg !26
  br i1 %tobool, label %if.then, label %if.else, !dbg !28

if.then:                                          ; preds = %entry
  %0 = load i8*, i8** %data, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !31
  %1 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  br label %if.end, !dbg !34

if.else:                                          ; preds = %entry
  %2 = load i8*, i8** %data, align 8, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !37
  %3 = load i8*, i8** %data, align 8, !dbg !38
  %arrayidx1 = getelementptr inbounds i8, i8* %3, i64 49, !dbg !38
  store i8 0, i8* %arrayidx1, align 1, !dbg !39
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !40, metadata !DIExpression()), !dbg !45
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !45
  %arraydecay2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !46
  %5 = load i8*, i8** %data, align 8, !dbg !47
  %6 = load i8*, i8** %data, align 8, !dbg !48
  %call3 = call i64 @strlen(i8* %6) #7, !dbg !49
  %mul = mul i64 %call3, 1, !dbg !50
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay2, i8* align 1 %5, i64 %mul, i1 false), !dbg !46
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !51
  store i8 0, i8* %arrayidx4, align 1, !dbg !52
  %7 = load i8*, i8** %data, align 8, !dbg !53
  call void @printLine(i8* %7), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_12_good() #0 !dbg !56 {
entry:
  call void @goodG2B(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #8, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #8, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_12_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_12_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !78 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !83
  store i8* %arraydecay, i8** %data, align 8, !dbg !84
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !85
  %tobool = icmp ne i32 %call, 0, !dbg !85
  br i1 %tobool, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %entry
  %0 = load i8*, i8** %data, align 8, !dbg !88
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !90
  %1 = load i8*, i8** %data, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !91
  store i8 0, i8* %arrayidx, align 1, !dbg !92
  br label %if.end, !dbg !93

if.else:                                          ; preds = %entry
  %2 = load i8*, i8** %data, align 8, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !96
  %3 = load i8*, i8** %data, align 8, !dbg !97
  %arrayidx1 = getelementptr inbounds i8, i8* %3, i64 49, !dbg !97
  store i8 0, i8* %arrayidx1, align 1, !dbg !98
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !99, metadata !DIExpression()), !dbg !101
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !101
  %arraydecay2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !102
  %5 = load i8*, i8** %data, align 8, !dbg !103
  %6 = load i8*, i8** %data, align 8, !dbg !104
  %call3 = call i64 @strlen(i8* %6) #7, !dbg !105
  %mul = mul i64 %call3, 1, !dbg !106
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay2, i8* align 1 %5, i64 %mul, i1 false), !dbg !102
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !107
  store i8 0, i8* %arrayidx4, align 1, !dbg !108
  %7 = load i8*, i8** %data, align 8, !dbg !109
  call void @printLine(i8* %7), !dbg !110
  ret void, !dbg !111
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_12.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_12_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_12.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocation(line: 27, column: 12, scope: !11)
!25 = !DILocation(line: 27, column: 10, scope: !11)
!26 = !DILocation(line: 28, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!28 = !DILocation(line: 28, column: 8, scope: !11)
!29 = !DILocation(line: 31, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !12, line: 29, column: 5)
!31 = !DILocation(line: 31, column: 9, scope: !30)
!32 = !DILocation(line: 32, column: 9, scope: !30)
!33 = !DILocation(line: 32, column: 21, scope: !30)
!34 = !DILocation(line: 33, column: 5, scope: !30)
!35 = !DILocation(line: 37, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !27, file: !12, line: 35, column: 5)
!37 = !DILocation(line: 37, column: 9, scope: !36)
!38 = !DILocation(line: 38, column: 9, scope: !36)
!39 = !DILocation(line: 38, column: 20, scope: !36)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !12, line: 41, type: !42)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 50)
!45 = !DILocation(line: 41, column: 14, scope: !41)
!46 = !DILocation(line: 43, column: 9, scope: !41)
!47 = !DILocation(line: 43, column: 23, scope: !41)
!48 = !DILocation(line: 43, column: 36, scope: !41)
!49 = !DILocation(line: 43, column: 29, scope: !41)
!50 = !DILocation(line: 43, column: 41, scope: !41)
!51 = !DILocation(line: 44, column: 9, scope: !41)
!52 = !DILocation(line: 44, column: 20, scope: !41)
!53 = !DILocation(line: 45, column: 19, scope: !41)
!54 = !DILocation(line: 45, column: 9, scope: !41)
!55 = !DILocation(line: 47, column: 1, scope: !11)
!56 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_12_good", scope: !12, file: !12, line: 81, type: !13, scopeLine: 82, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 83, column: 5, scope: !56)
!58 = !DILocation(line: 84, column: 1, scope: !56)
!59 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 96, type: !60, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!62, !62, !63}
!62 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !12, line: 96, type: !62)
!65 = !DILocation(line: 96, column: 14, scope: !59)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !12, line: 96, type: !63)
!67 = !DILocation(line: 96, column: 27, scope: !59)
!68 = !DILocation(line: 99, column: 22, scope: !59)
!69 = !DILocation(line: 99, column: 12, scope: !59)
!70 = !DILocation(line: 99, column: 5, scope: !59)
!71 = !DILocation(line: 101, column: 5, scope: !59)
!72 = !DILocation(line: 102, column: 5, scope: !59)
!73 = !DILocation(line: 103, column: 5, scope: !59)
!74 = !DILocation(line: 106, column: 5, scope: !59)
!75 = !DILocation(line: 107, column: 5, scope: !59)
!76 = !DILocation(line: 108, column: 5, scope: !59)
!77 = !DILocation(line: 110, column: 5, scope: !59)
!78 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !12, line: 57, type: !16)
!80 = !DILocation(line: 57, column: 12, scope: !78)
!81 = !DILocalVariable(name: "dataBuffer", scope: !78, file: !12, line: 58, type: !20)
!82 = !DILocation(line: 58, column: 10, scope: !78)
!83 = !DILocation(line: 59, column: 12, scope: !78)
!84 = !DILocation(line: 59, column: 10, scope: !78)
!85 = !DILocation(line: 60, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !78, file: !12, line: 60, column: 8)
!87 = !DILocation(line: 60, column: 8, scope: !78)
!88 = !DILocation(line: 63, column: 16, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !12, line: 61, column: 5)
!90 = !DILocation(line: 63, column: 9, scope: !89)
!91 = !DILocation(line: 64, column: 9, scope: !89)
!92 = !DILocation(line: 64, column: 20, scope: !89)
!93 = !DILocation(line: 65, column: 5, scope: !89)
!94 = !DILocation(line: 69, column: 16, scope: !95)
!95 = distinct !DILexicalBlock(scope: !86, file: !12, line: 67, column: 5)
!96 = !DILocation(line: 69, column: 9, scope: !95)
!97 = !DILocation(line: 70, column: 9, scope: !95)
!98 = !DILocation(line: 70, column: 20, scope: !95)
!99 = !DILocalVariable(name: "dest", scope: !100, file: !12, line: 73, type: !42)
!100 = distinct !DILexicalBlock(scope: !78, file: !12, line: 72, column: 5)
!101 = !DILocation(line: 73, column: 14, scope: !100)
!102 = !DILocation(line: 75, column: 9, scope: !100)
!103 = !DILocation(line: 75, column: 23, scope: !100)
!104 = !DILocation(line: 75, column: 36, scope: !100)
!105 = !DILocation(line: 75, column: 29, scope: !100)
!106 = !DILocation(line: 75, column: 41, scope: !100)
!107 = !DILocation(line: 76, column: 9, scope: !100)
!108 = !DILocation(line: 76, column: 20, scope: !100)
!109 = !DILocation(line: 77, column: 19, scope: !100)
!110 = !DILocation(line: 77, column: 9, scope: !100)
!111 = !DILocation(line: 79, column: 1, scope: !78)
