; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_07.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_07_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  %call = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !24
  store i8* %call, i8** %data, align 8, !dbg !25
  %0 = load i8*, i8** %data, align 8, !dbg !26
  %cmp = icmp eq i8* %0, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !32
  %cmp1 = icmp eq i32 %1, 5, !dbg !34
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !35

if.then2:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !38
  %3 = load i8*, i8** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !39
  store i8 0, i8* %arrayidx, align 1, !dbg !40
  br label %if.end3, !dbg !41

if.end3:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !42, metadata !DIExpression()), !dbg !47
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !47
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !48
  %5 = load i8*, i8** %data, align 8, !dbg !49
  %6 = load i8*, i8** %data, align 8, !dbg !50
  %call4 = call i64 @strlen(i8* %6) #10, !dbg !51
  %mul = mul i64 %call4, 1, !dbg !52
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %5, i64 %mul, i1 false), !dbg !48
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !53
  store i8 0, i8* %arrayidx5, align 1, !dbg !54
  %7 = load i8*, i8** %data, align 8, !dbg !55
  call void @printLine(i8* %7), !dbg !56
  %8 = load i8*, i8** %data, align 8, !dbg !57
  call void @free(i8* %8) #8, !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #6

declare dso_local void @printLine(i8*) #7

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_07_good() #0 !dbg !60 {
entry:
  call void @goodG2B1(), !dbg !61
  call void @goodG2B2(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #8, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #8, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_07_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_07_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !82 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !85
  store i8* %call, i8** %data, align 8, !dbg !86
  %0 = load i8*, i8** %data, align 8, !dbg !87
  %cmp = icmp eq i8* %0, null, !dbg !89
  br i1 %cmp, label %if.then, label %if.end, !dbg !90

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !91
  unreachable, !dbg !91

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !93
  %cmp1 = icmp ne i32 %1, 5, !dbg !95
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !96

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !97
  br label %if.end3, !dbg !99

if.else:                                          ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !102
  %3 = load i8*, i8** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !103
  store i8 0, i8* %arrayidx, align 1, !dbg !104
  br label %if.end3

if.end3:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !105, metadata !DIExpression()), !dbg !107
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !107
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !108
  %5 = load i8*, i8** %data, align 8, !dbg !109
  %6 = load i8*, i8** %data, align 8, !dbg !110
  %call4 = call i64 @strlen(i8* %6) #10, !dbg !111
  %mul = mul i64 %call4, 1, !dbg !112
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %5, i64 %mul, i1 false), !dbg !108
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !113
  store i8 0, i8* %arrayidx5, align 1, !dbg !114
  %7 = load i8*, i8** %data, align 8, !dbg !115
  call void @printLine(i8* %7), !dbg !116
  %8 = load i8*, i8** %data, align 8, !dbg !117
  call void @free(i8* %8) #8, !dbg !118
  ret void, !dbg !119
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !120 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !121, metadata !DIExpression()), !dbg !122
  %call = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !123
  store i8* %call, i8** %data, align 8, !dbg !124
  %0 = load i8*, i8** %data, align 8, !dbg !125
  %cmp = icmp eq i8* %0, null, !dbg !127
  br i1 %cmp, label %if.then, label %if.end, !dbg !128

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !129
  unreachable, !dbg !129

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !131
  %cmp1 = icmp eq i32 %1, 5, !dbg !133
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !134

if.then2:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !135
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !137
  %3 = load i8*, i8** %data, align 8, !dbg !138
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !138
  store i8 0, i8* %arrayidx, align 1, !dbg !139
  br label %if.end3, !dbg !140

if.end3:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !141, metadata !DIExpression()), !dbg !143
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !143
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !143
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !144
  %5 = load i8*, i8** %data, align 8, !dbg !145
  %6 = load i8*, i8** %data, align 8, !dbg !146
  %call4 = call i64 @strlen(i8* %6) #10, !dbg !147
  %mul = mul i64 %call4, 1, !dbg !148
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %5, i64 %mul, i1 false), !dbg !144
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !149
  store i8 0, i8* %arrayidx5, align 1, !dbg !150
  %7 = load i8*, i8** %data, align 8, !dbg !151
  call void @printLine(i8* %7), !dbg !152
  %8 = load i8*, i8** %data, align 8, !dbg !153
  call void @free(i8* %8) #8, !dbg !154
  ret void, !dbg !155
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !11, line: 25, type: !12, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0}
!11 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_07.c", directory: "/root/SSE-Assessment")
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_07_bad", scope: !11, file: !11, line: 29, type: !20, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !11, line: 31, type: !6)
!23 = !DILocation(line: 31, column: 12, scope: !19)
!24 = !DILocation(line: 32, column: 20, scope: !19)
!25 = !DILocation(line: 32, column: 10, scope: !19)
!26 = !DILocation(line: 33, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !19, file: !11, line: 33, column: 9)
!28 = !DILocation(line: 33, column: 14, scope: !27)
!29 = !DILocation(line: 33, column: 9, scope: !19)
!30 = !DILocation(line: 33, column: 24, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !11, line: 33, column: 23)
!32 = !DILocation(line: 34, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !19, file: !11, line: 34, column: 8)
!34 = !DILocation(line: 34, column: 18, scope: !33)
!35 = !DILocation(line: 34, column: 8, scope: !19)
!36 = !DILocation(line: 37, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !11, line: 35, column: 5)
!38 = !DILocation(line: 37, column: 9, scope: !37)
!39 = !DILocation(line: 38, column: 9, scope: !37)
!40 = !DILocation(line: 38, column: 21, scope: !37)
!41 = !DILocation(line: 39, column: 5, scope: !37)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !11, line: 41, type: !44)
!43 = distinct !DILexicalBlock(scope: !19, file: !11, line: 40, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 400, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 50)
!47 = !DILocation(line: 41, column: 14, scope: !43)
!48 = !DILocation(line: 43, column: 9, scope: !43)
!49 = !DILocation(line: 43, column: 23, scope: !43)
!50 = !DILocation(line: 43, column: 36, scope: !43)
!51 = !DILocation(line: 43, column: 29, scope: !43)
!52 = !DILocation(line: 43, column: 41, scope: !43)
!53 = !DILocation(line: 44, column: 9, scope: !43)
!54 = !DILocation(line: 44, column: 20, scope: !43)
!55 = !DILocation(line: 45, column: 19, scope: !43)
!56 = !DILocation(line: 45, column: 9, scope: !43)
!57 = !DILocation(line: 46, column: 14, scope: !43)
!58 = !DILocation(line: 46, column: 9, scope: !43)
!59 = !DILocation(line: 48, column: 1, scope: !19)
!60 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_07_good", scope: !11, file: !11, line: 103, type: !20, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DILocation(line: 105, column: 5, scope: !60)
!62 = !DILocation(line: 106, column: 5, scope: !60)
!63 = !DILocation(line: 107, column: 1, scope: !60)
!64 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 119, type: !65, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!65 = !DISubroutineType(types: !66)
!66 = !{!12, !12, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !11, line: 119, type: !12)
!69 = !DILocation(line: 119, column: 14, scope: !64)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !11, line: 119, type: !67)
!71 = !DILocation(line: 119, column: 27, scope: !64)
!72 = !DILocation(line: 122, column: 22, scope: !64)
!73 = !DILocation(line: 122, column: 12, scope: !64)
!74 = !DILocation(line: 122, column: 5, scope: !64)
!75 = !DILocation(line: 124, column: 5, scope: !64)
!76 = !DILocation(line: 125, column: 5, scope: !64)
!77 = !DILocation(line: 126, column: 5, scope: !64)
!78 = !DILocation(line: 129, column: 5, scope: !64)
!79 = !DILocation(line: 130, column: 5, scope: !64)
!80 = !DILocation(line: 131, column: 5, scope: !64)
!81 = !DILocation(line: 133, column: 5, scope: !64)
!82 = distinct !DISubprogram(name: "goodG2B1", scope: !11, file: !11, line: 55, type: !20, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!83 = !DILocalVariable(name: "data", scope: !82, file: !11, line: 57, type: !6)
!84 = !DILocation(line: 57, column: 12, scope: !82)
!85 = !DILocation(line: 58, column: 20, scope: !82)
!86 = !DILocation(line: 58, column: 10, scope: !82)
!87 = !DILocation(line: 59, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !82, file: !11, line: 59, column: 9)
!89 = !DILocation(line: 59, column: 14, scope: !88)
!90 = !DILocation(line: 59, column: 9, scope: !82)
!91 = !DILocation(line: 59, column: 24, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !11, line: 59, column: 23)
!93 = !DILocation(line: 60, column: 8, scope: !94)
!94 = distinct !DILexicalBlock(scope: !82, file: !11, line: 60, column: 8)
!95 = !DILocation(line: 60, column: 18, scope: !94)
!96 = !DILocation(line: 60, column: 8, scope: !82)
!97 = !DILocation(line: 63, column: 9, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !11, line: 61, column: 5)
!99 = !DILocation(line: 64, column: 5, scope: !98)
!100 = !DILocation(line: 68, column: 16, scope: !101)
!101 = distinct !DILexicalBlock(scope: !94, file: !11, line: 66, column: 5)
!102 = !DILocation(line: 68, column: 9, scope: !101)
!103 = !DILocation(line: 69, column: 9, scope: !101)
!104 = !DILocation(line: 69, column: 20, scope: !101)
!105 = !DILocalVariable(name: "dest", scope: !106, file: !11, line: 72, type: !44)
!106 = distinct !DILexicalBlock(scope: !82, file: !11, line: 71, column: 5)
!107 = !DILocation(line: 72, column: 14, scope: !106)
!108 = !DILocation(line: 74, column: 9, scope: !106)
!109 = !DILocation(line: 74, column: 23, scope: !106)
!110 = !DILocation(line: 74, column: 36, scope: !106)
!111 = !DILocation(line: 74, column: 29, scope: !106)
!112 = !DILocation(line: 74, column: 41, scope: !106)
!113 = !DILocation(line: 75, column: 9, scope: !106)
!114 = !DILocation(line: 75, column: 20, scope: !106)
!115 = !DILocation(line: 76, column: 19, scope: !106)
!116 = !DILocation(line: 76, column: 9, scope: !106)
!117 = !DILocation(line: 77, column: 14, scope: !106)
!118 = !DILocation(line: 77, column: 9, scope: !106)
!119 = !DILocation(line: 79, column: 1, scope: !82)
!120 = distinct !DISubprogram(name: "goodG2B2", scope: !11, file: !11, line: 82, type: !20, scopeLine: 83, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!121 = !DILocalVariable(name: "data", scope: !120, file: !11, line: 84, type: !6)
!122 = !DILocation(line: 84, column: 12, scope: !120)
!123 = !DILocation(line: 85, column: 20, scope: !120)
!124 = !DILocation(line: 85, column: 10, scope: !120)
!125 = !DILocation(line: 86, column: 9, scope: !126)
!126 = distinct !DILexicalBlock(scope: !120, file: !11, line: 86, column: 9)
!127 = !DILocation(line: 86, column: 14, scope: !126)
!128 = !DILocation(line: 86, column: 9, scope: !120)
!129 = !DILocation(line: 86, column: 24, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !11, line: 86, column: 23)
!131 = !DILocation(line: 87, column: 8, scope: !132)
!132 = distinct !DILexicalBlock(scope: !120, file: !11, line: 87, column: 8)
!133 = !DILocation(line: 87, column: 18, scope: !132)
!134 = !DILocation(line: 87, column: 8, scope: !120)
!135 = !DILocation(line: 90, column: 16, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !11, line: 88, column: 5)
!137 = !DILocation(line: 90, column: 9, scope: !136)
!138 = !DILocation(line: 91, column: 9, scope: !136)
!139 = !DILocation(line: 91, column: 20, scope: !136)
!140 = !DILocation(line: 92, column: 5, scope: !136)
!141 = !DILocalVariable(name: "dest", scope: !142, file: !11, line: 94, type: !44)
!142 = distinct !DILexicalBlock(scope: !120, file: !11, line: 93, column: 5)
!143 = !DILocation(line: 94, column: 14, scope: !142)
!144 = !DILocation(line: 96, column: 9, scope: !142)
!145 = !DILocation(line: 96, column: 23, scope: !142)
!146 = !DILocation(line: 96, column: 36, scope: !142)
!147 = !DILocation(line: 96, column: 29, scope: !142)
!148 = !DILocation(line: 96, column: 41, scope: !142)
!149 = !DILocation(line: 97, column: 9, scope: !142)
!150 = !DILocation(line: 97, column: 20, scope: !142)
!151 = !DILocation(line: 98, column: 19, scope: !142)
!152 = !DILocation(line: 98, column: 9, scope: !142)
!153 = !DILocation(line: 99, column: 14, scope: !142)
!154 = !DILocation(line: 99, column: 9, scope: !142)
!155 = !DILocation(line: 101, column: 1, scope: !120)
