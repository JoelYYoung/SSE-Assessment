; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_12_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  store i32* %arraydecay, i32** %data, align 8, !dbg !27
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !28
  %tobool = icmp ne i32 %call, 0, !dbg !28
  br i1 %tobool, label %if.then, label %if.else, !dbg !30

if.then:                                          ; preds = %entry
  %0 = load i32*, i32** %data, align 8, !dbg !31
  %call1 = call i32* @wmemset(i32* %0, i32 65, i64 99) #6, !dbg !33
  %1 = load i32*, i32** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  br label %if.end, !dbg !36

if.else:                                          ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !37
  %call2 = call i32* @wmemset(i32* %2, i32 65, i64 49) #6, !dbg !39
  %3 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx3 = getelementptr inbounds i32, i32* %3, i64 49, !dbg !40
  store i32 0, i32* %arrayidx3, align 4, !dbg !41
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !42, metadata !DIExpression()), !dbg !47
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !47
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !48
  %5 = load i32*, i32** %data, align 8, !dbg !49
  %call5 = call i64 @wcslen(i32* %5) #7, !dbg !50
  %6 = load i32*, i32** %data, align 8, !dbg !51
  %call6 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay4, i64 %call5, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %6) #6, !dbg !52
  %7 = load i32*, i32** %data, align 8, !dbg !53
  call void @printWLine(i32* %7), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_12_good() #0 !dbg !56 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #6, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #6, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_12_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_12_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !84
  store i32* %arraydecay, i32** %data, align 8, !dbg !85
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !86
  %tobool = icmp ne i32 %call, 0, !dbg !86
  br i1 %tobool, label %if.then, label %if.else, !dbg !88

if.then:                                          ; preds = %entry
  %0 = load i32*, i32** %data, align 8, !dbg !89
  %call1 = call i32* @wmemset(i32* %0, i32 65, i64 49) #6, !dbg !91
  %1 = load i32*, i32** %data, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !92
  store i32 0, i32* %arrayidx, align 4, !dbg !93
  br label %if.end, !dbg !94

if.else:                                          ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !95
  %call2 = call i32* @wmemset(i32* %2, i32 65, i64 49) #6, !dbg !97
  %3 = load i32*, i32** %data, align 8, !dbg !98
  %arrayidx3 = getelementptr inbounds i32, i32* %3, i64 49, !dbg !98
  store i32 0, i32* %arrayidx3, align 4, !dbg !99
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !100, metadata !DIExpression()), !dbg !102
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !102
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !103
  %5 = load i32*, i32** %data, align 8, !dbg !104
  %call5 = call i64 @wcslen(i32* %5) #7, !dbg !105
  %6 = load i32*, i32** %data, align 8, !dbg !106
  %call6 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay4, i64 %call5, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %6) #6, !dbg !107
  %7 = load i32*, i32** %data, align 8, !dbg !108
  call void @printWLine(i32* %7), !dbg !109
  ret void, !dbg !110
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_12.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_12_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_12.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 31, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 32, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 32, column: 13, scope: !11)
!26 = !DILocation(line: 33, column: 12, scope: !11)
!27 = !DILocation(line: 33, column: 10, scope: !11)
!28 = !DILocation(line: 34, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 8)
!30 = !DILocation(line: 34, column: 8, scope: !11)
!31 = !DILocation(line: 37, column: 17, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !12, line: 35, column: 5)
!33 = !DILocation(line: 37, column: 9, scope: !32)
!34 = !DILocation(line: 38, column: 9, scope: !32)
!35 = !DILocation(line: 38, column: 21, scope: !32)
!36 = !DILocation(line: 39, column: 5, scope: !32)
!37 = !DILocation(line: 43, column: 17, scope: !38)
!38 = distinct !DILexicalBlock(scope: !29, file: !12, line: 41, column: 5)
!39 = !DILocation(line: 43, column: 9, scope: !38)
!40 = !DILocation(line: 44, column: 9, scope: !38)
!41 = !DILocation(line: 44, column: 20, scope: !38)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !12, line: 47, type: !44)
!43 = distinct !DILexicalBlock(scope: !11, file: !12, line: 46, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 50)
!47 = !DILocation(line: 47, column: 17, scope: !43)
!48 = !DILocation(line: 49, column: 18, scope: !43)
!49 = !DILocation(line: 49, column: 31, scope: !43)
!50 = !DILocation(line: 49, column: 24, scope: !43)
!51 = !DILocation(line: 49, column: 45, scope: !43)
!52 = !DILocation(line: 49, column: 9, scope: !43)
!53 = !DILocation(line: 50, column: 20, scope: !43)
!54 = !DILocation(line: 50, column: 9, scope: !43)
!55 = !DILocation(line: 52, column: 1, scope: !11)
!56 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_12_good", scope: !12, file: !12, line: 85, type: !13, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 87, column: 5, scope: !56)
!58 = !DILocation(line: 88, column: 1, scope: !56)
!59 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 100, type: !60, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!19, !19, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !12, line: 100, type: !19)
!66 = !DILocation(line: 100, column: 14, scope: !59)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !12, line: 100, type: !62)
!68 = !DILocation(line: 100, column: 27, scope: !59)
!69 = !DILocation(line: 103, column: 22, scope: !59)
!70 = !DILocation(line: 103, column: 12, scope: !59)
!71 = !DILocation(line: 103, column: 5, scope: !59)
!72 = !DILocation(line: 105, column: 5, scope: !59)
!73 = !DILocation(line: 106, column: 5, scope: !59)
!74 = !DILocation(line: 107, column: 5, scope: !59)
!75 = !DILocation(line: 110, column: 5, scope: !59)
!76 = !DILocation(line: 111, column: 5, scope: !59)
!77 = !DILocation(line: 112, column: 5, scope: !59)
!78 = !DILocation(line: 114, column: 5, scope: !59)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !12, line: 62, type: !16)
!81 = !DILocation(line: 62, column: 15, scope: !79)
!82 = !DILocalVariable(name: "dataBuffer", scope: !79, file: !12, line: 63, type: !22)
!83 = !DILocation(line: 63, column: 13, scope: !79)
!84 = !DILocation(line: 64, column: 12, scope: !79)
!85 = !DILocation(line: 64, column: 10, scope: !79)
!86 = !DILocation(line: 65, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !79, file: !12, line: 65, column: 8)
!88 = !DILocation(line: 65, column: 8, scope: !79)
!89 = !DILocation(line: 68, column: 17, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !12, line: 66, column: 5)
!91 = !DILocation(line: 68, column: 9, scope: !90)
!92 = !DILocation(line: 69, column: 9, scope: !90)
!93 = !DILocation(line: 69, column: 20, scope: !90)
!94 = !DILocation(line: 70, column: 5, scope: !90)
!95 = !DILocation(line: 74, column: 17, scope: !96)
!96 = distinct !DILexicalBlock(scope: !87, file: !12, line: 72, column: 5)
!97 = !DILocation(line: 74, column: 9, scope: !96)
!98 = !DILocation(line: 75, column: 9, scope: !96)
!99 = !DILocation(line: 75, column: 20, scope: !96)
!100 = !DILocalVariable(name: "dest", scope: !101, file: !12, line: 78, type: !44)
!101 = distinct !DILexicalBlock(scope: !79, file: !12, line: 77, column: 5)
!102 = !DILocation(line: 78, column: 17, scope: !101)
!103 = !DILocation(line: 80, column: 18, scope: !101)
!104 = !DILocation(line: 80, column: 31, scope: !101)
!105 = !DILocation(line: 80, column: 24, scope: !101)
!106 = !DILocation(line: 80, column: 45, scope: !101)
!107 = !DILocation(line: 80, column: 9, scope: !101)
!108 = !DILocation(line: 81, column: 20, scope: !101)
!109 = !DILocation(line: 81, column: 9, scope: !101)
!110 = !DILocation(line: 83, column: 1, scope: !79)
