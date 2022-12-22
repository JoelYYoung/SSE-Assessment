; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_11.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_11_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !22
  %0 = bitcast i8* %call to i32*, !dbg !23
  store i32* %0, i32** %data, align 8, !dbg !24
  %1 = load i32*, i32** %data, align 8, !dbg !25
  %cmp = icmp eq i32* %1, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !31
  %tobool = icmp ne i32 %call1, 0, !dbg !31
  br i1 %tobool, label %if.then2, label %if.end4, !dbg !33

if.then2:                                         ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !34
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 99) #7, !dbg !36
  %3 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  br label %if.end4, !dbg !39

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !40, metadata !DIExpression()), !dbg !45
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !45
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !46
  %5 = load i32*, i32** %data, align 8, !dbg !47
  %call5 = call i64 @wcslen(i32* %5) #9, !dbg !48
  %6 = load i32*, i32** %data, align 8, !dbg !49
  %call6 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call5, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %6) #7, !dbg !50
  %7 = load i32*, i32** %data, align 8, !dbg !51
  call void @printWLine(i32* %7), !dbg !52
  %8 = load i32*, i32** %data, align 8, !dbg !53
  %9 = bitcast i32* %8 to i8*, !dbg !53
  call void @free(i8* %9) #7, !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local i32 @globalReturnsTrue(...) #4

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #6

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_11_good() #0 !dbg !56 {
entry:
  call void @goodG2B1(), !dbg !57
  call void @goodG2B2(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #7, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #7, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_11_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_11_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !80 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !83
  %0 = bitcast i8* %call to i32*, !dbg !84
  store i32* %0, i32** %data, align 8, !dbg !85
  %1 = load i32*, i32** %data, align 8, !dbg !86
  %cmp = icmp eq i32* %1, null, !dbg !88
  br i1 %cmp, label %if.then, label %if.end, !dbg !89

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !90
  unreachable, !dbg !90

if.end:                                           ; preds = %entry
  %call1 = call i32 (...) @globalReturnsFalse(), !dbg !92
  %tobool = icmp ne i32 %call1, 0, !dbg !92
  br i1 %tobool, label %if.then2, label %if.else, !dbg !94

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !95
  br label %if.end4, !dbg !97

if.else:                                          ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !98
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !100
  %3 = load i32*, i32** %data, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !101
  store i32 0, i32* %arrayidx, align 4, !dbg !102
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !103, metadata !DIExpression()), !dbg !105
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !105
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !106
  %5 = load i32*, i32** %data, align 8, !dbg !107
  %call5 = call i64 @wcslen(i32* %5) #9, !dbg !108
  %6 = load i32*, i32** %data, align 8, !dbg !109
  %call6 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call5, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %6) #7, !dbg !110
  %7 = load i32*, i32** %data, align 8, !dbg !111
  call void @printWLine(i32* %7), !dbg !112
  %8 = load i32*, i32** %data, align 8, !dbg !113
  %9 = bitcast i32* %8 to i8*, !dbg !113
  call void @free(i8* %9) #7, !dbg !114
  ret void, !dbg !115
}

declare dso_local i32 @globalReturnsFalse(...) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !116 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !117, metadata !DIExpression()), !dbg !118
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !119
  %0 = bitcast i8* %call to i32*, !dbg !120
  store i32* %0, i32** %data, align 8, !dbg !121
  %1 = load i32*, i32** %data, align 8, !dbg !122
  %cmp = icmp eq i32* %1, null, !dbg !124
  br i1 %cmp, label %if.then, label %if.end, !dbg !125

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !126
  unreachable, !dbg !126

if.end:                                           ; preds = %entry
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !128
  %tobool = icmp ne i32 %call1, 0, !dbg !128
  br i1 %tobool, label %if.then2, label %if.end4, !dbg !130

if.then2:                                         ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !131
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !133
  %3 = load i32*, i32** %data, align 8, !dbg !134
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !134
  store i32 0, i32* %arrayidx, align 4, !dbg !135
  br label %if.end4, !dbg !136

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !137, metadata !DIExpression()), !dbg !139
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !139
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !139
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !140
  %5 = load i32*, i32** %data, align 8, !dbg !141
  %call5 = call i64 @wcslen(i32* %5) #9, !dbg !142
  %6 = load i32*, i32** %data, align 8, !dbg !143
  %call6 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call5, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %6) #7, !dbg !144
  %7 = load i32*, i32** %data, align 8, !dbg !145
  call void @printWLine(i32* %7), !dbg !146
  %8 = load i32*, i32** %data, align 8, !dbg !147
  %9 = bitcast i32* %8 to i8*, !dbg !147
  call void @free(i8* %9) #7, !dbg !148
  ret void, !dbg !149
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_11.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_11_bad", scope: !17, file: !17, line: 29, type: !18, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_11.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 31, type: !4)
!21 = !DILocation(line: 31, column: 15, scope: !16)
!22 = !DILocation(line: 32, column: 23, scope: !16)
!23 = !DILocation(line: 32, column: 12, scope: !16)
!24 = !DILocation(line: 32, column: 10, scope: !16)
!25 = !DILocation(line: 33, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 33, column: 9)
!27 = !DILocation(line: 33, column: 14, scope: !26)
!28 = !DILocation(line: 33, column: 9, scope: !16)
!29 = !DILocation(line: 33, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !17, line: 33, column: 23)
!31 = !DILocation(line: 34, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !16, file: !17, line: 34, column: 8)
!33 = !DILocation(line: 34, column: 8, scope: !16)
!34 = !DILocation(line: 37, column: 17, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !17, line: 35, column: 5)
!36 = !DILocation(line: 37, column: 9, scope: !35)
!37 = !DILocation(line: 38, column: 9, scope: !35)
!38 = !DILocation(line: 38, column: 21, scope: !35)
!39 = !DILocation(line: 39, column: 5, scope: !35)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !17, line: 41, type: !42)
!41 = distinct !DILexicalBlock(scope: !16, file: !17, line: 40, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 50)
!45 = !DILocation(line: 41, column: 17, scope: !41)
!46 = !DILocation(line: 43, column: 18, scope: !41)
!47 = !DILocation(line: 43, column: 31, scope: !41)
!48 = !DILocation(line: 43, column: 24, scope: !41)
!49 = !DILocation(line: 43, column: 45, scope: !41)
!50 = !DILocation(line: 43, column: 9, scope: !41)
!51 = !DILocation(line: 44, column: 20, scope: !41)
!52 = !DILocation(line: 44, column: 9, scope: !41)
!53 = !DILocation(line: 45, column: 14, scope: !41)
!54 = !DILocation(line: 45, column: 9, scope: !41)
!55 = !DILocation(line: 47, column: 1, scope: !16)
!56 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_11_good", scope: !17, file: !17, line: 100, type: !18, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 102, column: 5, scope: !56)
!58 = !DILocation(line: 103, column: 5, scope: !56)
!59 = !DILocation(line: 104, column: 1, scope: !56)
!60 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 116, type: !61, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!7, !7, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !17, line: 116, type: !7)
!67 = !DILocation(line: 116, column: 14, scope: !60)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !17, line: 116, type: !63)
!69 = !DILocation(line: 116, column: 27, scope: !60)
!70 = !DILocation(line: 119, column: 22, scope: !60)
!71 = !DILocation(line: 119, column: 12, scope: !60)
!72 = !DILocation(line: 119, column: 5, scope: !60)
!73 = !DILocation(line: 121, column: 5, scope: !60)
!74 = !DILocation(line: 122, column: 5, scope: !60)
!75 = !DILocation(line: 123, column: 5, scope: !60)
!76 = !DILocation(line: 126, column: 5, scope: !60)
!77 = !DILocation(line: 127, column: 5, scope: !60)
!78 = !DILocation(line: 128, column: 5, scope: !60)
!79 = !DILocation(line: 130, column: 5, scope: !60)
!80 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 54, type: !18, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", scope: !80, file: !17, line: 56, type: !4)
!82 = !DILocation(line: 56, column: 15, scope: !80)
!83 = !DILocation(line: 57, column: 23, scope: !80)
!84 = !DILocation(line: 57, column: 12, scope: !80)
!85 = !DILocation(line: 57, column: 10, scope: !80)
!86 = !DILocation(line: 58, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !80, file: !17, line: 58, column: 9)
!88 = !DILocation(line: 58, column: 14, scope: !87)
!89 = !DILocation(line: 58, column: 9, scope: !80)
!90 = !DILocation(line: 58, column: 24, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !17, line: 58, column: 23)
!92 = !DILocation(line: 59, column: 8, scope: !93)
!93 = distinct !DILexicalBlock(scope: !80, file: !17, line: 59, column: 8)
!94 = !DILocation(line: 59, column: 8, scope: !80)
!95 = !DILocation(line: 62, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !17, line: 60, column: 5)
!97 = !DILocation(line: 63, column: 5, scope: !96)
!98 = !DILocation(line: 67, column: 17, scope: !99)
!99 = distinct !DILexicalBlock(scope: !93, file: !17, line: 65, column: 5)
!100 = !DILocation(line: 67, column: 9, scope: !99)
!101 = !DILocation(line: 68, column: 9, scope: !99)
!102 = !DILocation(line: 68, column: 20, scope: !99)
!103 = !DILocalVariable(name: "dest", scope: !104, file: !17, line: 71, type: !42)
!104 = distinct !DILexicalBlock(scope: !80, file: !17, line: 70, column: 5)
!105 = !DILocation(line: 71, column: 17, scope: !104)
!106 = !DILocation(line: 73, column: 18, scope: !104)
!107 = !DILocation(line: 73, column: 31, scope: !104)
!108 = !DILocation(line: 73, column: 24, scope: !104)
!109 = !DILocation(line: 73, column: 45, scope: !104)
!110 = !DILocation(line: 73, column: 9, scope: !104)
!111 = !DILocation(line: 74, column: 20, scope: !104)
!112 = !DILocation(line: 74, column: 9, scope: !104)
!113 = !DILocation(line: 75, column: 14, scope: !104)
!114 = !DILocation(line: 75, column: 9, scope: !104)
!115 = !DILocation(line: 77, column: 1, scope: !80)
!116 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 80, type: !18, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!117 = !DILocalVariable(name: "data", scope: !116, file: !17, line: 82, type: !4)
!118 = !DILocation(line: 82, column: 15, scope: !116)
!119 = !DILocation(line: 83, column: 23, scope: !116)
!120 = !DILocation(line: 83, column: 12, scope: !116)
!121 = !DILocation(line: 83, column: 10, scope: !116)
!122 = !DILocation(line: 84, column: 9, scope: !123)
!123 = distinct !DILexicalBlock(scope: !116, file: !17, line: 84, column: 9)
!124 = !DILocation(line: 84, column: 14, scope: !123)
!125 = !DILocation(line: 84, column: 9, scope: !116)
!126 = !DILocation(line: 84, column: 24, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !17, line: 84, column: 23)
!128 = !DILocation(line: 85, column: 8, scope: !129)
!129 = distinct !DILexicalBlock(scope: !116, file: !17, line: 85, column: 8)
!130 = !DILocation(line: 85, column: 8, scope: !116)
!131 = !DILocation(line: 88, column: 17, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !17, line: 86, column: 5)
!133 = !DILocation(line: 88, column: 9, scope: !132)
!134 = !DILocation(line: 89, column: 9, scope: !132)
!135 = !DILocation(line: 89, column: 20, scope: !132)
!136 = !DILocation(line: 90, column: 5, scope: !132)
!137 = !DILocalVariable(name: "dest", scope: !138, file: !17, line: 92, type: !42)
!138 = distinct !DILexicalBlock(scope: !116, file: !17, line: 91, column: 5)
!139 = !DILocation(line: 92, column: 17, scope: !138)
!140 = !DILocation(line: 94, column: 18, scope: !138)
!141 = !DILocation(line: 94, column: 31, scope: !138)
!142 = !DILocation(line: 94, column: 24, scope: !138)
!143 = !DILocation(line: 94, column: 45, scope: !138)
!144 = !DILocation(line: 94, column: 9, scope: !138)
!145 = !DILocation(line: 95, column: 20, scope: !138)
!146 = !DILocation(line: 95, column: 9, scope: !138)
!147 = !DILocation(line: 96, column: 14, scope: !138)
!148 = !DILocation(line: 96, column: 9, scope: !138)
!149 = !DILocation(line: 98, column: 1, scope: !116)
