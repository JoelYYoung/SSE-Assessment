; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !11
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !15

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_21_bad() #0 !dbg !23 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !26, metadata !DIExpression()), !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !28
  store i8* %call, i8** %data, align 8, !dbg !29
  %0 = load i8*, i8** %data, align 8, !dbg !30
  %cmp = icmp eq i8* %0, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  store i32 1, i32* @badStatic, align 4, !dbg !36
  %1 = load i8*, i8** %data, align 8, !dbg !37
  %call1 = call i8* @badSource(i8* %1), !dbg !38
  store i8* %call1, i8** %data, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !40, metadata !DIExpression()), !dbg !45
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !45
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !46
  %3 = load i8*, i8** %data, align 8, !dbg !47
  %4 = load i8*, i8** %data, align 8, !dbg !48
  %call2 = call i64 @strlen(i8* %4) #9, !dbg !49
  %call3 = call i8* @strncat(i8* %arraydecay, i8* %3, i64 %call2) #7, !dbg !50
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !51
  store i8 0, i8* %arrayidx, align 1, !dbg !52
  %5 = load i8*, i8** %data, align 8, !dbg !53
  call void @printLine(i8* %5), !dbg !54
  %6 = load i8*, i8** %data, align 8, !dbg !55
  call void @free(i8* %6) #7, !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !58 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %0 = load i32, i32* @badStatic, align 4, !dbg !63
  %tobool = icmp ne i32 %0, 0, !dbg !63
  br i1 %tobool, label %if.then, label %if.end, !dbg !65

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !66
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !68
  %2 = load i8*, i8** %data.addr, align 8, !dbg !69
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !69
  store i8 0, i8* %arrayidx, align 1, !dbg !70
  br label %if.end, !dbg !71

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8*, i8** %data.addr, align 8, !dbg !72
  ret i8* %3, !dbg !73
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strncat(i8*, i8*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_21_good() #0 !dbg !74 {
entry:
  call void @goodG2B1(), !dbg !75
  call void @goodG2B2(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call i64 @time(i64* null) #7, !dbg !86
  %conv = trunc i64 %call to i32, !dbg !87
  call void @srand(i32 %conv) #7, !dbg !88
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_21_good(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_21_bad(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !96 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !97, metadata !DIExpression()), !dbg !98
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !99
  store i8* %call, i8** %data, align 8, !dbg !100
  %0 = load i8*, i8** %data, align 8, !dbg !101
  %cmp = icmp eq i8* %0, null, !dbg !103
  br i1 %cmp, label %if.then, label %if.end, !dbg !104

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !105
  unreachable, !dbg !105

if.end:                                           ; preds = %entry
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !107
  %1 = load i8*, i8** %data, align 8, !dbg !108
  %call1 = call i8* @goodG2B1Source(i8* %1), !dbg !109
  store i8* %call1, i8** %data, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !111, metadata !DIExpression()), !dbg !113
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !113
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !114
  %3 = load i8*, i8** %data, align 8, !dbg !115
  %4 = load i8*, i8** %data, align 8, !dbg !116
  %call2 = call i64 @strlen(i8* %4) #9, !dbg !117
  %call3 = call i8* @strncat(i8* %arraydecay, i8* %3, i64 %call2) #7, !dbg !118
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !119
  store i8 0, i8* %arrayidx, align 1, !dbg !120
  %5 = load i8*, i8** %data, align 8, !dbg !121
  call void @printLine(i8* %5), !dbg !122
  %6 = load i8*, i8** %data, align 8, !dbg !123
  call void @free(i8* %6) #7, !dbg !124
  ret void, !dbg !125
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B1Source(i8* %data) #0 !dbg !126 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !127, metadata !DIExpression()), !dbg !128
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !129
  %tobool = icmp ne i32 %0, 0, !dbg !129
  br i1 %tobool, label %if.then, label %if.else, !dbg !131

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !132
  br label %if.end, !dbg !134

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !135
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !137
  %2 = load i8*, i8** %data.addr, align 8, !dbg !138
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !138
  store i8 0, i8* %arrayidx, align 1, !dbg !139
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i8*, i8** %data.addr, align 8, !dbg !140
  ret i8* %3, !dbg !141
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !142 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !143, metadata !DIExpression()), !dbg !144
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !145
  store i8* %call, i8** %data, align 8, !dbg !146
  %0 = load i8*, i8** %data, align 8, !dbg !147
  %cmp = icmp eq i8* %0, null, !dbg !149
  br i1 %cmp, label %if.then, label %if.end, !dbg !150

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !151
  unreachable, !dbg !151

if.end:                                           ; preds = %entry
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !153
  %1 = load i8*, i8** %data, align 8, !dbg !154
  %call1 = call i8* @goodG2B2Source(i8* %1), !dbg !155
  store i8* %call1, i8** %data, align 8, !dbg !156
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !157, metadata !DIExpression()), !dbg !159
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !159
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !159
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !160
  %3 = load i8*, i8** %data, align 8, !dbg !161
  %4 = load i8*, i8** %data, align 8, !dbg !162
  %call2 = call i64 @strlen(i8* %4) #9, !dbg !163
  %call3 = call i8* @strncat(i8* %arraydecay, i8* %3, i64 %call2) #7, !dbg !164
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !165
  store i8 0, i8* %arrayidx, align 1, !dbg !166
  %5 = load i8*, i8** %data, align 8, !dbg !167
  call void @printLine(i8* %5), !dbg !168
  %6 = load i8*, i8** %data, align 8, !dbg !169
  call void @free(i8* %6) #7, !dbg !170
  ret void, !dbg !171
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B2Source(i8* %data) #0 !dbg !172 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !173, metadata !DIExpression()), !dbg !174
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !175
  %tobool = icmp ne i32 %0, 0, !dbg !175
  br i1 %tobool, label %if.then, label %if.end, !dbg !177

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !178
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !180
  %2 = load i8*, i8** %data.addr, align 8, !dbg !181
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !181
  store i8 0, i8* %arrayidx, align 1, !dbg !182
  br label %if.end, !dbg !183

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8*, i8** %data.addr, align 8, !dbg !184
  ret i8* %3, !dbg !185
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
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !13, line: 24, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11, !15}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !13, line: 59, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_21.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !13, line: 60, type: !14, isLocal: true, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_21_bad", scope: !13, file: !13, line: 37, type: !24, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !13, line: 39, type: !6)
!27 = !DILocation(line: 39, column: 12, scope: !23)
!28 = !DILocation(line: 40, column: 20, scope: !23)
!29 = !DILocation(line: 40, column: 10, scope: !23)
!30 = !DILocation(line: 41, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !23, file: !13, line: 41, column: 9)
!32 = !DILocation(line: 41, column: 14, scope: !31)
!33 = !DILocation(line: 41, column: 9, scope: !23)
!34 = !DILocation(line: 41, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !13, line: 41, column: 23)
!36 = !DILocation(line: 42, column: 15, scope: !23)
!37 = !DILocation(line: 43, column: 22, scope: !23)
!38 = !DILocation(line: 43, column: 12, scope: !23)
!39 = !DILocation(line: 43, column: 10, scope: !23)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !13, line: 45, type: !42)
!41 = distinct !DILexicalBlock(scope: !23, file: !13, line: 44, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 400, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 50)
!45 = !DILocation(line: 45, column: 14, scope: !41)
!46 = !DILocation(line: 47, column: 17, scope: !41)
!47 = !DILocation(line: 47, column: 23, scope: !41)
!48 = !DILocation(line: 47, column: 36, scope: !41)
!49 = !DILocation(line: 47, column: 29, scope: !41)
!50 = !DILocation(line: 47, column: 9, scope: !41)
!51 = !DILocation(line: 48, column: 9, scope: !41)
!52 = !DILocation(line: 48, column: 20, scope: !41)
!53 = !DILocation(line: 49, column: 19, scope: !41)
!54 = !DILocation(line: 49, column: 9, scope: !41)
!55 = !DILocation(line: 50, column: 14, scope: !41)
!56 = !DILocation(line: 50, column: 9, scope: !41)
!57 = !DILocation(line: 52, column: 1, scope: !23)
!58 = distinct !DISubprogram(name: "badSource", scope: !13, file: !13, line: 26, type: !59, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DISubroutineType(types: !60)
!60 = !{!6, !6}
!61 = !DILocalVariable(name: "data", arg: 1, scope: !58, file: !13, line: 26, type: !6)
!62 = !DILocation(line: 26, column: 32, scope: !58)
!63 = !DILocation(line: 28, column: 8, scope: !64)
!64 = distinct !DILexicalBlock(scope: !58, file: !13, line: 28, column: 8)
!65 = !DILocation(line: 28, column: 8, scope: !58)
!66 = !DILocation(line: 31, column: 16, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !13, line: 29, column: 5)
!68 = !DILocation(line: 31, column: 9, scope: !67)
!69 = !DILocation(line: 32, column: 9, scope: !67)
!70 = !DILocation(line: 32, column: 21, scope: !67)
!71 = !DILocation(line: 33, column: 5, scope: !67)
!72 = !DILocation(line: 34, column: 12, scope: !58)
!73 = !DILocation(line: 34, column: 5, scope: !58)
!74 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_21_good", scope: !13, file: !13, line: 125, type: !24, scopeLine: 126, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!75 = !DILocation(line: 127, column: 5, scope: !74)
!76 = !DILocation(line: 128, column: 5, scope: !74)
!77 = !DILocation(line: 129, column: 1, scope: !74)
!78 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 141, type: !79, scopeLine: 142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DISubroutineType(types: !80)
!80 = !{!14, !14, !81}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !13, line: 141, type: !14)
!83 = !DILocation(line: 141, column: 14, scope: !78)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !13, line: 141, type: !81)
!85 = !DILocation(line: 141, column: 27, scope: !78)
!86 = !DILocation(line: 144, column: 22, scope: !78)
!87 = !DILocation(line: 144, column: 12, scope: !78)
!88 = !DILocation(line: 144, column: 5, scope: !78)
!89 = !DILocation(line: 146, column: 5, scope: !78)
!90 = !DILocation(line: 147, column: 5, scope: !78)
!91 = !DILocation(line: 148, column: 5, scope: !78)
!92 = !DILocation(line: 151, column: 5, scope: !78)
!93 = !DILocation(line: 152, column: 5, scope: !78)
!94 = !DILocation(line: 153, column: 5, scope: !78)
!95 = !DILocation(line: 155, column: 5, scope: !78)
!96 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 79, type: !24, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!97 = !DILocalVariable(name: "data", scope: !96, file: !13, line: 81, type: !6)
!98 = !DILocation(line: 81, column: 12, scope: !96)
!99 = !DILocation(line: 82, column: 20, scope: !96)
!100 = !DILocation(line: 82, column: 10, scope: !96)
!101 = !DILocation(line: 83, column: 9, scope: !102)
!102 = distinct !DILexicalBlock(scope: !96, file: !13, line: 83, column: 9)
!103 = !DILocation(line: 83, column: 14, scope: !102)
!104 = !DILocation(line: 83, column: 9, scope: !96)
!105 = !DILocation(line: 83, column: 24, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !13, line: 83, column: 23)
!107 = !DILocation(line: 84, column: 20, scope: !96)
!108 = !DILocation(line: 85, column: 27, scope: !96)
!109 = !DILocation(line: 85, column: 12, scope: !96)
!110 = !DILocation(line: 85, column: 10, scope: !96)
!111 = !DILocalVariable(name: "dest", scope: !112, file: !13, line: 87, type: !42)
!112 = distinct !DILexicalBlock(scope: !96, file: !13, line: 86, column: 5)
!113 = !DILocation(line: 87, column: 14, scope: !112)
!114 = !DILocation(line: 89, column: 17, scope: !112)
!115 = !DILocation(line: 89, column: 23, scope: !112)
!116 = !DILocation(line: 89, column: 36, scope: !112)
!117 = !DILocation(line: 89, column: 29, scope: !112)
!118 = !DILocation(line: 89, column: 9, scope: !112)
!119 = !DILocation(line: 90, column: 9, scope: !112)
!120 = !DILocation(line: 90, column: 20, scope: !112)
!121 = !DILocation(line: 91, column: 19, scope: !112)
!122 = !DILocation(line: 91, column: 9, scope: !112)
!123 = !DILocation(line: 92, column: 14, scope: !112)
!124 = !DILocation(line: 92, column: 9, scope: !112)
!125 = !DILocation(line: 94, column: 1, scope: !96)
!126 = distinct !DISubprogram(name: "goodG2B1Source", scope: !13, file: !13, line: 63, type: !59, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!127 = !DILocalVariable(name: "data", arg: 1, scope: !126, file: !13, line: 63, type: !6)
!128 = !DILocation(line: 63, column: 37, scope: !126)
!129 = !DILocation(line: 65, column: 8, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !13, line: 65, column: 8)
!131 = !DILocation(line: 65, column: 8, scope: !126)
!132 = !DILocation(line: 68, column: 9, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !13, line: 66, column: 5)
!134 = !DILocation(line: 69, column: 5, scope: !133)
!135 = !DILocation(line: 73, column: 16, scope: !136)
!136 = distinct !DILexicalBlock(scope: !130, file: !13, line: 71, column: 5)
!137 = !DILocation(line: 73, column: 9, scope: !136)
!138 = !DILocation(line: 74, column: 9, scope: !136)
!139 = !DILocation(line: 74, column: 20, scope: !136)
!140 = !DILocation(line: 76, column: 12, scope: !126)
!141 = !DILocation(line: 76, column: 5, scope: !126)
!142 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 108, type: !24, scopeLine: 109, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!143 = !DILocalVariable(name: "data", scope: !142, file: !13, line: 110, type: !6)
!144 = !DILocation(line: 110, column: 12, scope: !142)
!145 = !DILocation(line: 111, column: 20, scope: !142)
!146 = !DILocation(line: 111, column: 10, scope: !142)
!147 = !DILocation(line: 112, column: 9, scope: !148)
!148 = distinct !DILexicalBlock(scope: !142, file: !13, line: 112, column: 9)
!149 = !DILocation(line: 112, column: 14, scope: !148)
!150 = !DILocation(line: 112, column: 9, scope: !142)
!151 = !DILocation(line: 112, column: 24, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !13, line: 112, column: 23)
!153 = !DILocation(line: 113, column: 20, scope: !142)
!154 = !DILocation(line: 114, column: 27, scope: !142)
!155 = !DILocation(line: 114, column: 12, scope: !142)
!156 = !DILocation(line: 114, column: 10, scope: !142)
!157 = !DILocalVariable(name: "dest", scope: !158, file: !13, line: 116, type: !42)
!158 = distinct !DILexicalBlock(scope: !142, file: !13, line: 115, column: 5)
!159 = !DILocation(line: 116, column: 14, scope: !158)
!160 = !DILocation(line: 118, column: 17, scope: !158)
!161 = !DILocation(line: 118, column: 23, scope: !158)
!162 = !DILocation(line: 118, column: 36, scope: !158)
!163 = !DILocation(line: 118, column: 29, scope: !158)
!164 = !DILocation(line: 118, column: 9, scope: !158)
!165 = !DILocation(line: 119, column: 9, scope: !158)
!166 = !DILocation(line: 119, column: 20, scope: !158)
!167 = !DILocation(line: 120, column: 19, scope: !158)
!168 = !DILocation(line: 120, column: 9, scope: !158)
!169 = !DILocation(line: 121, column: 14, scope: !158)
!170 = !DILocation(line: 121, column: 9, scope: !158)
!171 = !DILocation(line: 123, column: 1, scope: !142)
!172 = distinct !DISubprogram(name: "goodG2B2Source", scope: !13, file: !13, line: 97, type: !59, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!173 = !DILocalVariable(name: "data", arg: 1, scope: !172, file: !13, line: 97, type: !6)
!174 = !DILocation(line: 97, column: 37, scope: !172)
!175 = !DILocation(line: 99, column: 8, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !13, line: 99, column: 8)
!177 = !DILocation(line: 99, column: 8, scope: !172)
!178 = !DILocation(line: 102, column: 16, scope: !179)
!179 = distinct !DILexicalBlock(scope: !176, file: !13, line: 100, column: 5)
!180 = !DILocation(line: 102, column: 9, scope: !179)
!181 = !DILocation(line: 103, column: 9, scope: !179)
!182 = !DILocation(line: 103, column: 20, scope: !179)
!183 = !DILocation(line: 104, column: 5, scope: !179)
!184 = !DILocation(line: 105, column: 12, scope: !172)
!185 = !DILocation(line: 105, column: 5, scope: !172)
