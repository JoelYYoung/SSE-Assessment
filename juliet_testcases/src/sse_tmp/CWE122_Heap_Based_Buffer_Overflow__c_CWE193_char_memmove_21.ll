; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_21_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !11
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !15
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_21_bad() #0 !dbg !23 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !26, metadata !DIExpression()), !dbg !27
  store i8* null, i8** %data, align 8, !dbg !28
  store i32 1, i32* @badStatic, align 4, !dbg !29
  %0 = load i8*, i8** %data, align 8, !dbg !30
  %call = call i8* @badSource(i8* %0), !dbg !31
  store i8* %call, i8** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !33, metadata !DIExpression()), !dbg !38
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !38
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_21_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !38
  %2 = load i8*, i8** %data, align 8, !dbg !39
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !40
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !41
  %call2 = call i64 @strlen(i8* %arraydecay1) #7, !dbg !42
  %add = add i64 %call2, 1, !dbg !43
  %mul = mul i64 %add, 1, !dbg !44
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !40
  %3 = load i8*, i8** %data, align 8, !dbg !45
  call void @printLine(i8* %3), !dbg !46
  %4 = load i8*, i8** %data, align 8, !dbg !47
  call void @free(i8* %4) #8, !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !50 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %0 = load i32, i32* @badStatic, align 4, !dbg !55
  %tobool = icmp ne i32 %0, 0, !dbg !55
  br i1 %tobool, label %if.then, label %if.end2, !dbg !57

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 10) #8, !dbg !58
  store i8* %call, i8** %data.addr, align 8, !dbg !60
  %1 = load i8*, i8** %data.addr, align 8, !dbg !61
  %cmp = icmp eq i8* %1, null, !dbg !63
  br i1 %cmp, label %if.then1, label %if.end, !dbg !64

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #9, !dbg !65
  unreachable, !dbg !65

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !67

if.end2:                                          ; preds = %if.end, %entry
  %2 = load i8*, i8** %data.addr, align 8, !dbg !68
  ret i8* %2, !dbg !69
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_21_good() #0 !dbg !70 {
entry:
  call void @goodG2B1(), !dbg !71
  call void @goodG2B2(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* null) #8, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #8, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_21_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_21_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !92 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !93, metadata !DIExpression()), !dbg !94
  store i8* null, i8** %data, align 8, !dbg !95
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !96
  %0 = load i8*, i8** %data, align 8, !dbg !97
  %call = call i8* @goodG2B1Source(i8* %0), !dbg !98
  store i8* %call, i8** %data, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !100, metadata !DIExpression()), !dbg !102
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !102
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !102
  %2 = load i8*, i8** %data, align 8, !dbg !103
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !104
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !105
  %call2 = call i64 @strlen(i8* %arraydecay1) #7, !dbg !106
  %add = add i64 %call2, 1, !dbg !107
  %mul = mul i64 %add, 1, !dbg !108
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !104
  %3 = load i8*, i8** %data, align 8, !dbg !109
  call void @printLine(i8* %3), !dbg !110
  %4 = load i8*, i8** %data, align 8, !dbg !111
  call void @free(i8* %4) #8, !dbg !112
  ret void, !dbg !113
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B1Source(i8* %data) #0 !dbg !114 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !115, metadata !DIExpression()), !dbg !116
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !117
  %tobool = icmp ne i32 %0, 0, !dbg !117
  br i1 %tobool, label %if.then, label %if.else, !dbg !119

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !120
  br label %if.end2, !dbg !122

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 11) #8, !dbg !123
  store i8* %call, i8** %data.addr, align 8, !dbg !125
  %1 = load i8*, i8** %data.addr, align 8, !dbg !126
  %cmp = icmp eq i8* %1, null, !dbg !128
  br i1 %cmp, label %if.then1, label %if.end, !dbg !129

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #9, !dbg !130
  unreachable, !dbg !130

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %2 = load i8*, i8** %data.addr, align 8, !dbg !132
  ret i8* %2, !dbg !133
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !134 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !135, metadata !DIExpression()), !dbg !136
  store i8* null, i8** %data, align 8, !dbg !137
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !138
  %0 = load i8*, i8** %data, align 8, !dbg !139
  %call = call i8* @goodG2B2Source(i8* %0), !dbg !140
  store i8* %call, i8** %data, align 8, !dbg !141
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !142, metadata !DIExpression()), !dbg !144
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !144
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !144
  %2 = load i8*, i8** %data, align 8, !dbg !145
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !146
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !147
  %call2 = call i64 @strlen(i8* %arraydecay1) #7, !dbg !148
  %add = add i64 %call2, 1, !dbg !149
  %mul = mul i64 %add, 1, !dbg !150
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !146
  %3 = load i8*, i8** %data, align 8, !dbg !151
  call void @printLine(i8* %3), !dbg !152
  %4 = load i8*, i8** %data, align 8, !dbg !153
  call void @free(i8* %4) #8, !dbg !154
  ret void, !dbg !155
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B2Source(i8* %data) #0 !dbg !156 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !157, metadata !DIExpression()), !dbg !158
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !159
  %tobool = icmp ne i32 %0, 0, !dbg !159
  br i1 %tobool, label %if.then, label %if.end2, !dbg !161

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 11) #8, !dbg !162
  store i8* %call, i8** %data.addr, align 8, !dbg !164
  %1 = load i8*, i8** %data.addr, align 8, !dbg !165
  %cmp = icmp eq i8* %1, null, !dbg !167
  br i1 %cmp, label %if.then1, label %if.end, !dbg !168

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #9, !dbg !169
  unreachable, !dbg !169

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !171

if.end2:                                          ; preds = %if.end, %entry
  %2 = load i8*, i8** %data.addr, align 8, !dbg !172
  ret i8* %2, !dbg !173
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !13, line: 29, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !9}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{!0, !11, !15}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !13, line: 63, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_21.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !13, line: 64, type: !14, isLocal: true, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_21_bad", scope: !13, file: !13, line: 42, type: !24, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !13, line: 44, type: !7)
!27 = !DILocation(line: 44, column: 12, scope: !23)
!28 = !DILocation(line: 45, column: 10, scope: !23)
!29 = !DILocation(line: 46, column: 15, scope: !23)
!30 = !DILocation(line: 47, column: 22, scope: !23)
!31 = !DILocation(line: 47, column: 12, scope: !23)
!32 = !DILocation(line: 47, column: 10, scope: !23)
!33 = !DILocalVariable(name: "source", scope: !34, file: !13, line: 49, type: !35)
!34 = distinct !DILexicalBlock(scope: !23, file: !13, line: 48, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 88, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 11)
!38 = !DILocation(line: 49, column: 14, scope: !34)
!39 = !DILocation(line: 52, column: 17, scope: !34)
!40 = !DILocation(line: 52, column: 9, scope: !34)
!41 = !DILocation(line: 52, column: 39, scope: !34)
!42 = !DILocation(line: 52, column: 32, scope: !34)
!43 = !DILocation(line: 52, column: 47, scope: !34)
!44 = !DILocation(line: 52, column: 52, scope: !34)
!45 = !DILocation(line: 53, column: 19, scope: !34)
!46 = !DILocation(line: 53, column: 9, scope: !34)
!47 = !DILocation(line: 54, column: 14, scope: !34)
!48 = !DILocation(line: 54, column: 9, scope: !34)
!49 = !DILocation(line: 56, column: 1, scope: !23)
!50 = distinct !DISubprogram(name: "badSource", scope: !13, file: !13, line: 31, type: !51, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!51 = !DISubroutineType(types: !52)
!52 = !{!7, !7}
!53 = !DILocalVariable(name: "data", arg: 1, scope: !50, file: !13, line: 31, type: !7)
!54 = !DILocation(line: 31, column: 32, scope: !50)
!55 = !DILocation(line: 33, column: 8, scope: !56)
!56 = distinct !DILexicalBlock(scope: !50, file: !13, line: 33, column: 8)
!57 = !DILocation(line: 33, column: 8, scope: !50)
!58 = !DILocation(line: 36, column: 24, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !13, line: 34, column: 5)
!60 = !DILocation(line: 36, column: 14, scope: !59)
!61 = !DILocation(line: 37, column: 13, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !13, line: 37, column: 13)
!63 = !DILocation(line: 37, column: 18, scope: !62)
!64 = !DILocation(line: 37, column: 13, scope: !59)
!65 = !DILocation(line: 37, column: 28, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !13, line: 37, column: 27)
!67 = !DILocation(line: 38, column: 5, scope: !59)
!68 = !DILocation(line: 39, column: 12, scope: !50)
!69 = !DILocation(line: 39, column: 5, scope: !50)
!70 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_21_good", scope: !13, file: !13, line: 127, type: !24, scopeLine: 128, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!71 = !DILocation(line: 129, column: 5, scope: !70)
!72 = !DILocation(line: 130, column: 5, scope: !70)
!73 = !DILocation(line: 131, column: 1, scope: !70)
!74 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 143, type: !75, scopeLine: 144, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!75 = !DISubroutineType(types: !76)
!76 = !{!14, !14, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !13, line: 143, type: !14)
!79 = !DILocation(line: 143, column: 14, scope: !74)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !13, line: 143, type: !77)
!81 = !DILocation(line: 143, column: 27, scope: !74)
!82 = !DILocation(line: 146, column: 22, scope: !74)
!83 = !DILocation(line: 146, column: 12, scope: !74)
!84 = !DILocation(line: 146, column: 5, scope: !74)
!85 = !DILocation(line: 148, column: 5, scope: !74)
!86 = !DILocation(line: 149, column: 5, scope: !74)
!87 = !DILocation(line: 150, column: 5, scope: !74)
!88 = !DILocation(line: 153, column: 5, scope: !74)
!89 = !DILocation(line: 154, column: 5, scope: !74)
!90 = !DILocation(line: 155, column: 5, scope: !74)
!91 = !DILocation(line: 157, column: 5, scope: !74)
!92 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 83, type: !24, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!93 = !DILocalVariable(name: "data", scope: !92, file: !13, line: 85, type: !7)
!94 = !DILocation(line: 85, column: 12, scope: !92)
!95 = !DILocation(line: 86, column: 10, scope: !92)
!96 = !DILocation(line: 87, column: 20, scope: !92)
!97 = !DILocation(line: 88, column: 27, scope: !92)
!98 = !DILocation(line: 88, column: 12, scope: !92)
!99 = !DILocation(line: 88, column: 10, scope: !92)
!100 = !DILocalVariable(name: "source", scope: !101, file: !13, line: 90, type: !35)
!101 = distinct !DILexicalBlock(scope: !92, file: !13, line: 89, column: 5)
!102 = !DILocation(line: 90, column: 14, scope: !101)
!103 = !DILocation(line: 93, column: 17, scope: !101)
!104 = !DILocation(line: 93, column: 9, scope: !101)
!105 = !DILocation(line: 93, column: 39, scope: !101)
!106 = !DILocation(line: 93, column: 32, scope: !101)
!107 = !DILocation(line: 93, column: 47, scope: !101)
!108 = !DILocation(line: 93, column: 52, scope: !101)
!109 = !DILocation(line: 94, column: 19, scope: !101)
!110 = !DILocation(line: 94, column: 9, scope: !101)
!111 = !DILocation(line: 95, column: 14, scope: !101)
!112 = !DILocation(line: 95, column: 9, scope: !101)
!113 = !DILocation(line: 97, column: 1, scope: !92)
!114 = distinct !DISubprogram(name: "goodG2B1Source", scope: !13, file: !13, line: 67, type: !51, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!115 = !DILocalVariable(name: "data", arg: 1, scope: !114, file: !13, line: 67, type: !7)
!116 = !DILocation(line: 67, column: 37, scope: !114)
!117 = !DILocation(line: 69, column: 8, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !13, line: 69, column: 8)
!119 = !DILocation(line: 69, column: 8, scope: !114)
!120 = !DILocation(line: 72, column: 9, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !13, line: 70, column: 5)
!122 = !DILocation(line: 73, column: 5, scope: !121)
!123 = !DILocation(line: 77, column: 24, scope: !124)
!124 = distinct !DILexicalBlock(scope: !118, file: !13, line: 75, column: 5)
!125 = !DILocation(line: 77, column: 14, scope: !124)
!126 = !DILocation(line: 78, column: 13, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !13, line: 78, column: 13)
!128 = !DILocation(line: 78, column: 18, scope: !127)
!129 = !DILocation(line: 78, column: 13, scope: !124)
!130 = !DILocation(line: 78, column: 28, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !13, line: 78, column: 27)
!132 = !DILocation(line: 80, column: 12, scope: !114)
!133 = !DILocation(line: 80, column: 5, scope: !114)
!134 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 111, type: !24, scopeLine: 112, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!135 = !DILocalVariable(name: "data", scope: !134, file: !13, line: 113, type: !7)
!136 = !DILocation(line: 113, column: 12, scope: !134)
!137 = !DILocation(line: 114, column: 10, scope: !134)
!138 = !DILocation(line: 115, column: 20, scope: !134)
!139 = !DILocation(line: 116, column: 27, scope: !134)
!140 = !DILocation(line: 116, column: 12, scope: !134)
!141 = !DILocation(line: 116, column: 10, scope: !134)
!142 = !DILocalVariable(name: "source", scope: !143, file: !13, line: 118, type: !35)
!143 = distinct !DILexicalBlock(scope: !134, file: !13, line: 117, column: 5)
!144 = !DILocation(line: 118, column: 14, scope: !143)
!145 = !DILocation(line: 121, column: 17, scope: !143)
!146 = !DILocation(line: 121, column: 9, scope: !143)
!147 = !DILocation(line: 121, column: 39, scope: !143)
!148 = !DILocation(line: 121, column: 32, scope: !143)
!149 = !DILocation(line: 121, column: 47, scope: !143)
!150 = !DILocation(line: 121, column: 52, scope: !143)
!151 = !DILocation(line: 122, column: 19, scope: !143)
!152 = !DILocation(line: 122, column: 9, scope: !143)
!153 = !DILocation(line: 123, column: 14, scope: !143)
!154 = !DILocation(line: 123, column: 9, scope: !143)
!155 = !DILocation(line: 125, column: 1, scope: !134)
!156 = distinct !DISubprogram(name: "goodG2B2Source", scope: !13, file: !13, line: 100, type: !51, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!157 = !DILocalVariable(name: "data", arg: 1, scope: !156, file: !13, line: 100, type: !7)
!158 = !DILocation(line: 100, column: 37, scope: !156)
!159 = !DILocation(line: 102, column: 8, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !13, line: 102, column: 8)
!161 = !DILocation(line: 102, column: 8, scope: !156)
!162 = !DILocation(line: 105, column: 24, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !13, line: 103, column: 5)
!164 = !DILocation(line: 105, column: 14, scope: !163)
!165 = !DILocation(line: 106, column: 13, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !13, line: 106, column: 13)
!167 = !DILocation(line: 106, column: 18, scope: !166)
!168 = !DILocation(line: 106, column: 13, scope: !163)
!169 = !DILocation(line: 106, column: 28, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !13, line: 106, column: 27)
!171 = !DILocation(line: 107, column: 5, scope: !163)
!172 = !DILocation(line: 108, column: 12, scope: !156)
!173 = !DILocation(line: 108, column: 5, scope: !156)
