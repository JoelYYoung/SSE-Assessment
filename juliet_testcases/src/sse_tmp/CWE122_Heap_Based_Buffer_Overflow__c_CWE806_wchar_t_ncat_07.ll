; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_07.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_07_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !25
  %0 = bitcast i8* %call to i32*, !dbg !26
  store i32* %0, i32** %data, align 8, !dbg !27
  %1 = load i32*, i32** %data, align 8, !dbg !28
  %cmp = icmp eq i32* %1, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @staticFive, align 4, !dbg !34
  %cmp1 = icmp eq i32 %2, 5, !dbg !36
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !37

if.then2:                                         ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !38
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #7, !dbg !40
  %4 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  br label %if.end4, !dbg !43

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !44, metadata !DIExpression()), !dbg !49
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !49
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !50
  %6 = load i32*, i32** %data, align 8, !dbg !51
  %7 = load i32*, i32** %data, align 8, !dbg !52
  %call5 = call i64 @wcslen(i32* %7) #9, !dbg !53
  %call6 = call i32* @wcsncat(i32* %arraydecay, i32* %6, i64 %call5) #7, !dbg !54
  %arrayidx7 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !55
  store i32 0, i32* %arrayidx7, align 4, !dbg !56
  %8 = load i32*, i32** %data, align 8, !dbg !57
  call void @printWLine(i32* %8), !dbg !58
  %9 = load i32*, i32** %data, align 8, !dbg !59
  %10 = bitcast i32* %9 to i8*, !dbg !59
  call void @free(i8* %10) #7, !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32* @wcsncat(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_07_good() #0 !dbg !62 {
entry:
  call void @goodG2B1(), !dbg !63
  call void @goodG2B2(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* null) #7, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #7, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_07_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_07_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !86 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !89
  %0 = bitcast i8* %call to i32*, !dbg !90
  store i32* %0, i32** %data, align 8, !dbg !91
  %1 = load i32*, i32** %data, align 8, !dbg !92
  %cmp = icmp eq i32* %1, null, !dbg !94
  br i1 %cmp, label %if.then, label %if.end, !dbg !95

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !96
  unreachable, !dbg !96

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @staticFive, align 4, !dbg !98
  %cmp1 = icmp ne i32 %2, 5, !dbg !100
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !101

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !102
  br label %if.end4, !dbg !104

if.else:                                          ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !105
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !107
  %4 = load i32*, i32** %data, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !108
  store i32 0, i32* %arrayidx, align 4, !dbg !109
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !110, metadata !DIExpression()), !dbg !112
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !112
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !113
  %6 = load i32*, i32** %data, align 8, !dbg !114
  %7 = load i32*, i32** %data, align 8, !dbg !115
  %call5 = call i64 @wcslen(i32* %7) #9, !dbg !116
  %call6 = call i32* @wcsncat(i32* %arraydecay, i32* %6, i64 %call5) #7, !dbg !117
  %arrayidx7 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !118
  store i32 0, i32* %arrayidx7, align 4, !dbg !119
  %8 = load i32*, i32** %data, align 8, !dbg !120
  call void @printWLine(i32* %8), !dbg !121
  %9 = load i32*, i32** %data, align 8, !dbg !122
  %10 = bitcast i32* %9 to i8*, !dbg !122
  call void @free(i8* %10) #7, !dbg !123
  ret void, !dbg !124
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !125 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !126, metadata !DIExpression()), !dbg !127
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !128
  %0 = bitcast i8* %call to i32*, !dbg !129
  store i32* %0, i32** %data, align 8, !dbg !130
  %1 = load i32*, i32** %data, align 8, !dbg !131
  %cmp = icmp eq i32* %1, null, !dbg !133
  br i1 %cmp, label %if.then, label %if.end, !dbg !134

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !135
  unreachable, !dbg !135

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @staticFive, align 4, !dbg !137
  %cmp1 = icmp eq i32 %2, 5, !dbg !139
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !140

if.then2:                                         ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !141
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !143
  %4 = load i32*, i32** %data, align 8, !dbg !144
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !144
  store i32 0, i32* %arrayidx, align 4, !dbg !145
  br label %if.end4, !dbg !146

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !147, metadata !DIExpression()), !dbg !149
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !149
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !149
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !150
  %6 = load i32*, i32** %data, align 8, !dbg !151
  %7 = load i32*, i32** %data, align 8, !dbg !152
  %call5 = call i64 @wcslen(i32* %7) #9, !dbg !153
  %call6 = call i32* @wcsncat(i32* %arraydecay, i32* %6, i64 %call5) #7, !dbg !154
  %arrayidx7 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !155
  store i32 0, i32* %arrayidx7, align 4, !dbg !156
  %8 = load i32*, i32** %data, align 8, !dbg !157
  call void @printWLine(i32* %8), !dbg !158
  %9 = load i32*, i32** %data, align 8, !dbg !159
  %10 = bitcast i32* %9 to i8*, !dbg !159
  call void @free(i8* %10) #7, !dbg !160
  ret void, !dbg !161
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !13, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0}
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_07.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_07_bad", scope: !13, file: !13, line: 29, type: !21, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !13, line: 31, type: !6)
!24 = !DILocation(line: 31, column: 15, scope: !20)
!25 = !DILocation(line: 32, column: 23, scope: !20)
!26 = !DILocation(line: 32, column: 12, scope: !20)
!27 = !DILocation(line: 32, column: 10, scope: !20)
!28 = !DILocation(line: 33, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !20, file: !13, line: 33, column: 9)
!30 = !DILocation(line: 33, column: 14, scope: !29)
!31 = !DILocation(line: 33, column: 9, scope: !20)
!32 = !DILocation(line: 33, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !13, line: 33, column: 23)
!34 = !DILocation(line: 34, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !20, file: !13, line: 34, column: 8)
!36 = !DILocation(line: 34, column: 18, scope: !35)
!37 = !DILocation(line: 34, column: 8, scope: !20)
!38 = !DILocation(line: 37, column: 17, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !13, line: 35, column: 5)
!40 = !DILocation(line: 37, column: 9, scope: !39)
!41 = !DILocation(line: 38, column: 9, scope: !39)
!42 = !DILocation(line: 38, column: 21, scope: !39)
!43 = !DILocation(line: 39, column: 5, scope: !39)
!44 = !DILocalVariable(name: "dest", scope: !45, file: !13, line: 41, type: !46)
!45 = distinct !DILexicalBlock(scope: !20, file: !13, line: 40, column: 5)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 50)
!49 = !DILocation(line: 41, column: 17, scope: !45)
!50 = !DILocation(line: 43, column: 17, scope: !45)
!51 = !DILocation(line: 43, column: 23, scope: !45)
!52 = !DILocation(line: 43, column: 36, scope: !45)
!53 = !DILocation(line: 43, column: 29, scope: !45)
!54 = !DILocation(line: 43, column: 9, scope: !45)
!55 = !DILocation(line: 44, column: 9, scope: !45)
!56 = !DILocation(line: 44, column: 20, scope: !45)
!57 = !DILocation(line: 45, column: 20, scope: !45)
!58 = !DILocation(line: 45, column: 9, scope: !45)
!59 = !DILocation(line: 46, column: 14, scope: !45)
!60 = !DILocation(line: 46, column: 9, scope: !45)
!61 = !DILocation(line: 48, column: 1, scope: !20)
!62 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_ncat_07_good", scope: !13, file: !13, line: 103, type: !21, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!63 = !DILocation(line: 105, column: 5, scope: !62)
!64 = !DILocation(line: 106, column: 5, scope: !62)
!65 = !DILocation(line: 107, column: 1, scope: !62)
!66 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 119, type: !67, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!67 = !DISubroutineType(types: !68)
!68 = !{!9, !9, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !13, line: 119, type: !9)
!73 = !DILocation(line: 119, column: 14, scope: !66)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !13, line: 119, type: !69)
!75 = !DILocation(line: 119, column: 27, scope: !66)
!76 = !DILocation(line: 122, column: 22, scope: !66)
!77 = !DILocation(line: 122, column: 12, scope: !66)
!78 = !DILocation(line: 122, column: 5, scope: !66)
!79 = !DILocation(line: 124, column: 5, scope: !66)
!80 = !DILocation(line: 125, column: 5, scope: !66)
!81 = !DILocation(line: 126, column: 5, scope: !66)
!82 = !DILocation(line: 129, column: 5, scope: !66)
!83 = !DILocation(line: 130, column: 5, scope: !66)
!84 = !DILocation(line: 131, column: 5, scope: !66)
!85 = !DILocation(line: 133, column: 5, scope: !66)
!86 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 55, type: !21, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!87 = !DILocalVariable(name: "data", scope: !86, file: !13, line: 57, type: !6)
!88 = !DILocation(line: 57, column: 15, scope: !86)
!89 = !DILocation(line: 58, column: 23, scope: !86)
!90 = !DILocation(line: 58, column: 12, scope: !86)
!91 = !DILocation(line: 58, column: 10, scope: !86)
!92 = !DILocation(line: 59, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !86, file: !13, line: 59, column: 9)
!94 = !DILocation(line: 59, column: 14, scope: !93)
!95 = !DILocation(line: 59, column: 9, scope: !86)
!96 = !DILocation(line: 59, column: 24, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !13, line: 59, column: 23)
!98 = !DILocation(line: 60, column: 8, scope: !99)
!99 = distinct !DILexicalBlock(scope: !86, file: !13, line: 60, column: 8)
!100 = !DILocation(line: 60, column: 18, scope: !99)
!101 = !DILocation(line: 60, column: 8, scope: !86)
!102 = !DILocation(line: 63, column: 9, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !13, line: 61, column: 5)
!104 = !DILocation(line: 64, column: 5, scope: !103)
!105 = !DILocation(line: 68, column: 17, scope: !106)
!106 = distinct !DILexicalBlock(scope: !99, file: !13, line: 66, column: 5)
!107 = !DILocation(line: 68, column: 9, scope: !106)
!108 = !DILocation(line: 69, column: 9, scope: !106)
!109 = !DILocation(line: 69, column: 20, scope: !106)
!110 = !DILocalVariable(name: "dest", scope: !111, file: !13, line: 72, type: !46)
!111 = distinct !DILexicalBlock(scope: !86, file: !13, line: 71, column: 5)
!112 = !DILocation(line: 72, column: 17, scope: !111)
!113 = !DILocation(line: 74, column: 17, scope: !111)
!114 = !DILocation(line: 74, column: 23, scope: !111)
!115 = !DILocation(line: 74, column: 36, scope: !111)
!116 = !DILocation(line: 74, column: 29, scope: !111)
!117 = !DILocation(line: 74, column: 9, scope: !111)
!118 = !DILocation(line: 75, column: 9, scope: !111)
!119 = !DILocation(line: 75, column: 20, scope: !111)
!120 = !DILocation(line: 76, column: 20, scope: !111)
!121 = !DILocation(line: 76, column: 9, scope: !111)
!122 = !DILocation(line: 77, column: 14, scope: !111)
!123 = !DILocation(line: 77, column: 9, scope: !111)
!124 = !DILocation(line: 79, column: 1, scope: !86)
!125 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 82, type: !21, scopeLine: 83, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!126 = !DILocalVariable(name: "data", scope: !125, file: !13, line: 84, type: !6)
!127 = !DILocation(line: 84, column: 15, scope: !125)
!128 = !DILocation(line: 85, column: 23, scope: !125)
!129 = !DILocation(line: 85, column: 12, scope: !125)
!130 = !DILocation(line: 85, column: 10, scope: !125)
!131 = !DILocation(line: 86, column: 9, scope: !132)
!132 = distinct !DILexicalBlock(scope: !125, file: !13, line: 86, column: 9)
!133 = !DILocation(line: 86, column: 14, scope: !132)
!134 = !DILocation(line: 86, column: 9, scope: !125)
!135 = !DILocation(line: 86, column: 24, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !13, line: 86, column: 23)
!137 = !DILocation(line: 87, column: 8, scope: !138)
!138 = distinct !DILexicalBlock(scope: !125, file: !13, line: 87, column: 8)
!139 = !DILocation(line: 87, column: 18, scope: !138)
!140 = !DILocation(line: 87, column: 8, scope: !125)
!141 = !DILocation(line: 90, column: 17, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !13, line: 88, column: 5)
!143 = !DILocation(line: 90, column: 9, scope: !142)
!144 = !DILocation(line: 91, column: 9, scope: !142)
!145 = !DILocation(line: 91, column: 20, scope: !142)
!146 = !DILocation(line: 92, column: 5, scope: !142)
!147 = !DILocalVariable(name: "dest", scope: !148, file: !13, line: 94, type: !46)
!148 = distinct !DILexicalBlock(scope: !125, file: !13, line: 93, column: 5)
!149 = !DILocation(line: 94, column: 17, scope: !148)
!150 = !DILocation(line: 96, column: 17, scope: !148)
!151 = !DILocation(line: 96, column: 23, scope: !148)
!152 = !DILocation(line: 96, column: 36, scope: !148)
!153 = !DILocation(line: 96, column: 29, scope: !148)
!154 = !DILocation(line: 96, column: 9, scope: !148)
!155 = !DILocation(line: 97, column: 9, scope: !148)
!156 = !DILocation(line: 97, column: 20, scope: !148)
!157 = !DILocation(line: 98, column: 20, scope: !148)
!158 = !DILocation(line: 98, column: 9, scope: !148)
!159 = !DILocation(line: 99, column: 14, scope: !148)
!160 = !DILocation(line: 99, column: 9, scope: !148)
!161 = !DILocation(line: 101, column: 1, scope: !125)
