; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_08_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 400, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBuffer, align 8, !dbg !22
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !25
  store i32* %2, i32** %data, align 8, !dbg !26
  %call = call i32 @staticReturnsTrue(), !dbg !27
  %tobool = icmp ne i32 %call, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  %3 = load i32*, i32** %data, align 8, !dbg !30
  %call1 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !32
  %4 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  br label %if.end, !dbg !35

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !36, metadata !DIExpression()), !dbg !41
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !41
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !42
  %6 = load i32*, i32** %data, align 8, !dbg !43
  %call2 = call i64 @wcslen(i32* %6) #7, !dbg !44
  %7 = load i32*, i32** %data, align 8, !dbg !45
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %7) #6, !dbg !46
  %8 = load i32*, i32** %data, align 8, !dbg !47
  call void @printWLine(i32* %8), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_08_good() #0 !dbg !50 {
entry:
  call void @goodG2B1(), !dbg !51
  call void @goodG2B2(), !dbg !52
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #6, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #6, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_08_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_08_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !74 {
entry:
  ret i32 1, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %0 = alloca i8, i64 400, align 16, !dbg !83
  %1 = bitcast i8* %0 to i32*, !dbg !84
  store i32* %1, i32** %dataBuffer, align 8, !dbg !82
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !85
  store i32* %2, i32** %data, align 8, !dbg !86
  %call = call i32 @staticReturnsFalse(), !dbg !87
  %tobool = icmp ne i32 %call, 0, !dbg !87
  br i1 %tobool, label %if.then, label %if.else, !dbg !89

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !90
  br label %if.end, !dbg !92

if.else:                                          ; preds = %entry
  %3 = load i32*, i32** %data, align 8, !dbg !93
  %call1 = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !95
  %4 = load i32*, i32** %data, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !96
  store i32 0, i32* %arrayidx, align 4, !dbg !97
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !98, metadata !DIExpression()), !dbg !100
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !100
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !101
  %6 = load i32*, i32** %data, align 8, !dbg !102
  %call2 = call i64 @wcslen(i32* %6) #7, !dbg !103
  %7 = load i32*, i32** %data, align 8, !dbg !104
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %7) #6, !dbg !105
  %8 = load i32*, i32** %data, align 8, !dbg !106
  call void @printWLine(i32* %8), !dbg !107
  ret void, !dbg !108
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !109 {
entry:
  ret i32 0, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !111 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %0 = alloca i8, i64 400, align 16, !dbg !116
  %1 = bitcast i8* %0 to i32*, !dbg !117
  store i32* %1, i32** %dataBuffer, align 8, !dbg !115
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !118
  store i32* %2, i32** %data, align 8, !dbg !119
  %call = call i32 @staticReturnsTrue(), !dbg !120
  %tobool = icmp ne i32 %call, 0, !dbg !120
  br i1 %tobool, label %if.then, label %if.end, !dbg !122

if.then:                                          ; preds = %entry
  %3 = load i32*, i32** %data, align 8, !dbg !123
  %call1 = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !125
  %4 = load i32*, i32** %data, align 8, !dbg !126
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !126
  store i32 0, i32* %arrayidx, align 4, !dbg !127
  br label %if.end, !dbg !128

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !129, metadata !DIExpression()), !dbg !131
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !131
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !132
  %6 = load i32*, i32** %data, align 8, !dbg !133
  %call2 = call i64 @wcslen(i32* %6) #7, !dbg !134
  %7 = load i32*, i32** %data, align 8, !dbg !135
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %7) #6, !dbg !136
  %8 = load i32*, i32** %data, align 8, !dbg !137
  call void @printWLine(i32* %8), !dbg !138
  ret void, !dbg !139
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_08.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_08_bad", scope: !16, file: !16, line: 43, type: !17, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_08.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 45, type: !4)
!20 = !DILocation(line: 45, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 46, type: !4)
!22 = !DILocation(line: 46, column: 15, scope: !15)
!23 = !DILocation(line: 46, column: 39, scope: !15)
!24 = !DILocation(line: 46, column: 28, scope: !15)
!25 = !DILocation(line: 47, column: 12, scope: !15)
!26 = !DILocation(line: 47, column: 10, scope: !15)
!27 = !DILocation(line: 48, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !15, file: !16, line: 48, column: 8)
!29 = !DILocation(line: 48, column: 8, scope: !15)
!30 = !DILocation(line: 51, column: 17, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !16, line: 49, column: 5)
!32 = !DILocation(line: 51, column: 9, scope: !31)
!33 = !DILocation(line: 52, column: 9, scope: !31)
!34 = !DILocation(line: 52, column: 21, scope: !31)
!35 = !DILocation(line: 53, column: 5, scope: !31)
!36 = !DILocalVariable(name: "dest", scope: !37, file: !16, line: 55, type: !38)
!37 = distinct !DILexicalBlock(scope: !15, file: !16, line: 54, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 50)
!41 = !DILocation(line: 55, column: 17, scope: !37)
!42 = !DILocation(line: 57, column: 18, scope: !37)
!43 = !DILocation(line: 57, column: 31, scope: !37)
!44 = !DILocation(line: 57, column: 24, scope: !37)
!45 = !DILocation(line: 57, column: 45, scope: !37)
!46 = !DILocation(line: 57, column: 9, scope: !37)
!47 = !DILocation(line: 58, column: 20, scope: !37)
!48 = !DILocation(line: 58, column: 9, scope: !37)
!49 = !DILocation(line: 60, column: 1, scope: !15)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_08_good", scope: !16, file: !16, line: 111, type: !17, scopeLine: 112, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 113, column: 5, scope: !50)
!52 = !DILocation(line: 114, column: 5, scope: !50)
!53 = !DILocation(line: 115, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 127, type: !55, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!7, !7, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !16, line: 127, type: !7)
!61 = !DILocation(line: 127, column: 14, scope: !54)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !16, line: 127, type: !57)
!63 = !DILocation(line: 127, column: 27, scope: !54)
!64 = !DILocation(line: 130, column: 22, scope: !54)
!65 = !DILocation(line: 130, column: 12, scope: !54)
!66 = !DILocation(line: 130, column: 5, scope: !54)
!67 = !DILocation(line: 132, column: 5, scope: !54)
!68 = !DILocation(line: 133, column: 5, scope: !54)
!69 = !DILocation(line: 134, column: 5, scope: !54)
!70 = !DILocation(line: 137, column: 5, scope: !54)
!71 = !DILocation(line: 138, column: 5, scope: !54)
!72 = !DILocation(line: 139, column: 5, scope: !54)
!73 = !DILocation(line: 141, column: 5, scope: !54)
!74 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !16, file: !16, line: 31, type: !75, scopeLine: 32, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!7}
!77 = !DILocation(line: 33, column: 5, scope: !74)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 67, type: !17, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !16, line: 69, type: !4)
!80 = !DILocation(line: 69, column: 15, scope: !78)
!81 = !DILocalVariable(name: "dataBuffer", scope: !78, file: !16, line: 70, type: !4)
!82 = !DILocation(line: 70, column: 15, scope: !78)
!83 = !DILocation(line: 70, column: 39, scope: !78)
!84 = !DILocation(line: 70, column: 28, scope: !78)
!85 = !DILocation(line: 71, column: 12, scope: !78)
!86 = !DILocation(line: 71, column: 10, scope: !78)
!87 = !DILocation(line: 72, column: 8, scope: !88)
!88 = distinct !DILexicalBlock(scope: !78, file: !16, line: 72, column: 8)
!89 = !DILocation(line: 72, column: 8, scope: !78)
!90 = !DILocation(line: 75, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !16, line: 73, column: 5)
!92 = !DILocation(line: 76, column: 5, scope: !91)
!93 = !DILocation(line: 80, column: 17, scope: !94)
!94 = distinct !DILexicalBlock(scope: !88, file: !16, line: 78, column: 5)
!95 = !DILocation(line: 80, column: 9, scope: !94)
!96 = !DILocation(line: 81, column: 9, scope: !94)
!97 = !DILocation(line: 81, column: 20, scope: !94)
!98 = !DILocalVariable(name: "dest", scope: !99, file: !16, line: 84, type: !38)
!99 = distinct !DILexicalBlock(scope: !78, file: !16, line: 83, column: 5)
!100 = !DILocation(line: 84, column: 17, scope: !99)
!101 = !DILocation(line: 86, column: 18, scope: !99)
!102 = !DILocation(line: 86, column: 31, scope: !99)
!103 = !DILocation(line: 86, column: 24, scope: !99)
!104 = !DILocation(line: 86, column: 45, scope: !99)
!105 = !DILocation(line: 86, column: 9, scope: !99)
!106 = !DILocation(line: 87, column: 20, scope: !99)
!107 = !DILocation(line: 87, column: 9, scope: !99)
!108 = !DILocation(line: 89, column: 1, scope: !78)
!109 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !16, file: !16, line: 36, type: !75, scopeLine: 37, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocation(line: 38, column: 5, scope: !109)
!111 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 92, type: !17, scopeLine: 93, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "data", scope: !111, file: !16, line: 94, type: !4)
!113 = !DILocation(line: 94, column: 15, scope: !111)
!114 = !DILocalVariable(name: "dataBuffer", scope: !111, file: !16, line: 95, type: !4)
!115 = !DILocation(line: 95, column: 15, scope: !111)
!116 = !DILocation(line: 95, column: 39, scope: !111)
!117 = !DILocation(line: 95, column: 28, scope: !111)
!118 = !DILocation(line: 96, column: 12, scope: !111)
!119 = !DILocation(line: 96, column: 10, scope: !111)
!120 = !DILocation(line: 97, column: 8, scope: !121)
!121 = distinct !DILexicalBlock(scope: !111, file: !16, line: 97, column: 8)
!122 = !DILocation(line: 97, column: 8, scope: !111)
!123 = !DILocation(line: 100, column: 17, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !16, line: 98, column: 5)
!125 = !DILocation(line: 100, column: 9, scope: !124)
!126 = !DILocation(line: 101, column: 9, scope: !124)
!127 = !DILocation(line: 101, column: 20, scope: !124)
!128 = !DILocation(line: 102, column: 5, scope: !124)
!129 = !DILocalVariable(name: "dest", scope: !130, file: !16, line: 104, type: !38)
!130 = distinct !DILexicalBlock(scope: !111, file: !16, line: 103, column: 5)
!131 = !DILocation(line: 104, column: 17, scope: !130)
!132 = !DILocation(line: 106, column: 18, scope: !130)
!133 = !DILocation(line: 106, column: 31, scope: !130)
!134 = !DILocation(line: 106, column: 24, scope: !130)
!135 = !DILocation(line: 106, column: 45, scope: !130)
!136 = !DILocation(line: 106, column: 9, scope: !130)
!137 = !DILocation(line: 107, column: 20, scope: !130)
!138 = !DILocation(line: 107, column: 9, scope: !130)
!139 = !DILocation(line: 109, column: 1, scope: !111)
