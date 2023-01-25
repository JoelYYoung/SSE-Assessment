; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_21.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !8
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !12

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_21_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !32
  store i8* %arraydecay, i8** %data, align 8, !dbg !33
  store i32 1, i32* @badStatic, align 4, !dbg !34
  %0 = load i8*, i8** %data, align 8, !dbg !35
  %call = call i8* @badSource(i8* %0), !dbg !36
  store i8* %call, i8** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !43
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !44
  %2 = load i8*, i8** %data, align 8, !dbg !45
  %3 = load i8*, i8** %data, align 8, !dbg !46
  %call2 = call i64 @strlen(i8* %3) #6, !dbg !47
  %call3 = call i8* @strncat(i8* %arraydecay1, i8* %2, i64 %call2) #7, !dbg !48
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !49
  store i8 0, i8* %arrayidx, align 1, !dbg !50
  %4 = load i8*, i8** %data, align 8, !dbg !51
  call void @printLine(i8* %4), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !54 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %0 = load i32, i32* @badStatic, align 4, !dbg !59
  %tobool = icmp ne i32 %0, 0, !dbg !59
  br i1 %tobool, label %if.then, label %if.end, !dbg !61

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !62
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !64
  %2 = load i8*, i8** %data.addr, align 8, !dbg !65
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !65
  store i8 0, i8* %arrayidx, align 1, !dbg !66
  br label %if.end, !dbg !67

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8*, i8** %data.addr, align 8, !dbg !68
  ret i8* %3, !dbg !69
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncat(i8*, i8*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_21_good() #0 !dbg !70 {
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
  %call = call i64 @time(i64* null) #7, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #7, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_21_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_21_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !92 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !97
  store i8* %arraydecay, i8** %data, align 8, !dbg !98
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !99
  %0 = load i8*, i8** %data, align 8, !dbg !100
  %call = call i8* @goodG2B1Source(i8* %0), !dbg !101
  store i8* %call, i8** %data, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !103, metadata !DIExpression()), !dbg !105
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !105
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !106
  %2 = load i8*, i8** %data, align 8, !dbg !107
  %3 = load i8*, i8** %data, align 8, !dbg !108
  %call2 = call i64 @strlen(i8* %3) #6, !dbg !109
  %call3 = call i8* @strncat(i8* %arraydecay1, i8* %2, i64 %call2) #7, !dbg !110
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !111
  store i8 0, i8* %arrayidx, align 1, !dbg !112
  %4 = load i8*, i8** %data, align 8, !dbg !113
  call void @printLine(i8* %4), !dbg !114
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B1Source(i8* %data) #0 !dbg !116 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !117, metadata !DIExpression()), !dbg !118
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !119
  %tobool = icmp ne i32 %0, 0, !dbg !119
  br i1 %tobool, label %if.then, label %if.else, !dbg !121

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !122
  br label %if.end, !dbg !124

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !127
  %2 = load i8*, i8** %data.addr, align 8, !dbg !128
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !128
  store i8 0, i8* %arrayidx, align 1, !dbg !129
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i8*, i8** %data.addr, align 8, !dbg !130
  ret i8* %3, !dbg !131
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !132 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !133, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !135, metadata !DIExpression()), !dbg !136
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !137
  store i8* %arraydecay, i8** %data, align 8, !dbg !138
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !139
  %0 = load i8*, i8** %data, align 8, !dbg !140
  %call = call i8* @goodG2B2Source(i8* %0), !dbg !141
  store i8* %call, i8** %data, align 8, !dbg !142
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !143, metadata !DIExpression()), !dbg !145
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !145
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !145
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !146
  %2 = load i8*, i8** %data, align 8, !dbg !147
  %3 = load i8*, i8** %data, align 8, !dbg !148
  %call2 = call i64 @strlen(i8* %3) #6, !dbg !149
  %call3 = call i8* @strncat(i8* %arraydecay1, i8* %2, i64 %call2) #7, !dbg !150
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !151
  store i8 0, i8* %arrayidx, align 1, !dbg !152
  %4 = load i8*, i8** %data, align 8, !dbg !153
  call void @printLine(i8* %4), !dbg !154
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
  br i1 %tobool, label %if.then, label %if.end, !dbg !161

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !162
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !164
  %2 = load i8*, i8** %data.addr, align 8, !dbg !165
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !165
  store i8 0, i8* %arrayidx, align 1, !dbg !166
  br label %if.end, !dbg !167

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8*, i8** %data.addr, align 8, !dbg !168
  ret i8* %3, !dbg !169
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !10, line: 24, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !10, line: 58, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_21.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !10, line: 59, type: !11, isLocal: true, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_21_bad", scope: !10, file: !10, line: 37, type: !21, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 39, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!26 = !DILocation(line: 39, column: 12, scope: !20)
!27 = !DILocalVariable(name: "dataBuffer", scope: !20, file: !10, line: 40, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 800, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 40, column: 10, scope: !20)
!32 = !DILocation(line: 41, column: 12, scope: !20)
!33 = !DILocation(line: 41, column: 10, scope: !20)
!34 = !DILocation(line: 42, column: 15, scope: !20)
!35 = !DILocation(line: 43, column: 22, scope: !20)
!36 = !DILocation(line: 43, column: 12, scope: !20)
!37 = !DILocation(line: 43, column: 10, scope: !20)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !10, line: 45, type: !40)
!39 = distinct !DILexicalBlock(scope: !20, file: !10, line: 44, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 400, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 45, column: 14, scope: !39)
!44 = !DILocation(line: 47, column: 17, scope: !39)
!45 = !DILocation(line: 47, column: 23, scope: !39)
!46 = !DILocation(line: 47, column: 36, scope: !39)
!47 = !DILocation(line: 47, column: 29, scope: !39)
!48 = !DILocation(line: 47, column: 9, scope: !39)
!49 = !DILocation(line: 48, column: 9, scope: !39)
!50 = !DILocation(line: 48, column: 20, scope: !39)
!51 = !DILocation(line: 49, column: 19, scope: !39)
!52 = !DILocation(line: 49, column: 9, scope: !39)
!53 = !DILocation(line: 51, column: 1, scope: !20)
!54 = distinct !DISubprogram(name: "badSource", scope: !10, file: !10, line: 26, type: !55, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!55 = !DISubroutineType(types: !56)
!56 = !{!24, !24}
!57 = !DILocalVariable(name: "data", arg: 1, scope: !54, file: !10, line: 26, type: !24)
!58 = !DILocation(line: 26, column: 32, scope: !54)
!59 = !DILocation(line: 28, column: 8, scope: !60)
!60 = distinct !DILexicalBlock(scope: !54, file: !10, line: 28, column: 8)
!61 = !DILocation(line: 28, column: 8, scope: !54)
!62 = !DILocation(line: 31, column: 16, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !10, line: 29, column: 5)
!64 = !DILocation(line: 31, column: 9, scope: !63)
!65 = !DILocation(line: 32, column: 9, scope: !63)
!66 = !DILocation(line: 32, column: 21, scope: !63)
!67 = !DILocation(line: 33, column: 5, scope: !63)
!68 = !DILocation(line: 34, column: 12, scope: !54)
!69 = !DILocation(line: 34, column: 5, scope: !54)
!70 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_21_good", scope: !10, file: !10, line: 122, type: !21, scopeLine: 123, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!71 = !DILocation(line: 124, column: 5, scope: !70)
!72 = !DILocation(line: 125, column: 5, scope: !70)
!73 = !DILocation(line: 126, column: 1, scope: !70)
!74 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 138, type: !75, scopeLine: 139, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!75 = !DISubroutineType(types: !76)
!76 = !{!11, !11, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !10, line: 138, type: !11)
!79 = !DILocation(line: 138, column: 14, scope: !74)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !10, line: 138, type: !77)
!81 = !DILocation(line: 138, column: 27, scope: !74)
!82 = !DILocation(line: 141, column: 22, scope: !74)
!83 = !DILocation(line: 141, column: 12, scope: !74)
!84 = !DILocation(line: 141, column: 5, scope: !74)
!85 = !DILocation(line: 143, column: 5, scope: !74)
!86 = !DILocation(line: 144, column: 5, scope: !74)
!87 = !DILocation(line: 145, column: 5, scope: !74)
!88 = !DILocation(line: 148, column: 5, scope: !74)
!89 = !DILocation(line: 149, column: 5, scope: !74)
!90 = !DILocation(line: 150, column: 5, scope: !74)
!91 = !DILocation(line: 152, column: 5, scope: !74)
!92 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 78, type: !21, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!93 = !DILocalVariable(name: "data", scope: !92, file: !10, line: 80, type: !24)
!94 = !DILocation(line: 80, column: 12, scope: !92)
!95 = !DILocalVariable(name: "dataBuffer", scope: !92, file: !10, line: 81, type: !28)
!96 = !DILocation(line: 81, column: 10, scope: !92)
!97 = !DILocation(line: 82, column: 12, scope: !92)
!98 = !DILocation(line: 82, column: 10, scope: !92)
!99 = !DILocation(line: 83, column: 20, scope: !92)
!100 = !DILocation(line: 84, column: 27, scope: !92)
!101 = !DILocation(line: 84, column: 12, scope: !92)
!102 = !DILocation(line: 84, column: 10, scope: !92)
!103 = !DILocalVariable(name: "dest", scope: !104, file: !10, line: 86, type: !40)
!104 = distinct !DILexicalBlock(scope: !92, file: !10, line: 85, column: 5)
!105 = !DILocation(line: 86, column: 14, scope: !104)
!106 = !DILocation(line: 88, column: 17, scope: !104)
!107 = !DILocation(line: 88, column: 23, scope: !104)
!108 = !DILocation(line: 88, column: 36, scope: !104)
!109 = !DILocation(line: 88, column: 29, scope: !104)
!110 = !DILocation(line: 88, column: 9, scope: !104)
!111 = !DILocation(line: 89, column: 9, scope: !104)
!112 = !DILocation(line: 89, column: 20, scope: !104)
!113 = !DILocation(line: 90, column: 19, scope: !104)
!114 = !DILocation(line: 90, column: 9, scope: !104)
!115 = !DILocation(line: 92, column: 1, scope: !92)
!116 = distinct !DISubprogram(name: "goodG2B1Source", scope: !10, file: !10, line: 62, type: !55, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!117 = !DILocalVariable(name: "data", arg: 1, scope: !116, file: !10, line: 62, type: !24)
!118 = !DILocation(line: 62, column: 37, scope: !116)
!119 = !DILocation(line: 64, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !10, line: 64, column: 8)
!121 = !DILocation(line: 64, column: 8, scope: !116)
!122 = !DILocation(line: 67, column: 9, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !10, line: 65, column: 5)
!124 = !DILocation(line: 68, column: 5, scope: !123)
!125 = !DILocation(line: 72, column: 16, scope: !126)
!126 = distinct !DILexicalBlock(scope: !120, file: !10, line: 70, column: 5)
!127 = !DILocation(line: 72, column: 9, scope: !126)
!128 = !DILocation(line: 73, column: 9, scope: !126)
!129 = !DILocation(line: 73, column: 20, scope: !126)
!130 = !DILocation(line: 75, column: 12, scope: !116)
!131 = !DILocation(line: 75, column: 5, scope: !116)
!132 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 106, type: !21, scopeLine: 107, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!133 = !DILocalVariable(name: "data", scope: !132, file: !10, line: 108, type: !24)
!134 = !DILocation(line: 108, column: 12, scope: !132)
!135 = !DILocalVariable(name: "dataBuffer", scope: !132, file: !10, line: 109, type: !28)
!136 = !DILocation(line: 109, column: 10, scope: !132)
!137 = !DILocation(line: 110, column: 12, scope: !132)
!138 = !DILocation(line: 110, column: 10, scope: !132)
!139 = !DILocation(line: 111, column: 20, scope: !132)
!140 = !DILocation(line: 112, column: 27, scope: !132)
!141 = !DILocation(line: 112, column: 12, scope: !132)
!142 = !DILocation(line: 112, column: 10, scope: !132)
!143 = !DILocalVariable(name: "dest", scope: !144, file: !10, line: 114, type: !40)
!144 = distinct !DILexicalBlock(scope: !132, file: !10, line: 113, column: 5)
!145 = !DILocation(line: 114, column: 14, scope: !144)
!146 = !DILocation(line: 116, column: 17, scope: !144)
!147 = !DILocation(line: 116, column: 23, scope: !144)
!148 = !DILocation(line: 116, column: 36, scope: !144)
!149 = !DILocation(line: 116, column: 29, scope: !144)
!150 = !DILocation(line: 116, column: 9, scope: !144)
!151 = !DILocation(line: 117, column: 9, scope: !144)
!152 = !DILocation(line: 117, column: 20, scope: !144)
!153 = !DILocation(line: 118, column: 19, scope: !144)
!154 = !DILocation(line: 118, column: 9, scope: !144)
!155 = !DILocation(line: 120, column: 1, scope: !132)
!156 = distinct !DISubprogram(name: "goodG2B2Source", scope: !10, file: !10, line: 95, type: !55, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!157 = !DILocalVariable(name: "data", arg: 1, scope: !156, file: !10, line: 95, type: !24)
!158 = !DILocation(line: 95, column: 37, scope: !156)
!159 = !DILocation(line: 97, column: 8, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !10, line: 97, column: 8)
!161 = !DILocation(line: 97, column: 8, scope: !156)
!162 = !DILocation(line: 100, column: 16, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !10, line: 98, column: 5)
!164 = !DILocation(line: 100, column: 9, scope: !163)
!165 = !DILocation(line: 101, column: 9, scope: !163)
!166 = !DILocation(line: 101, column: 20, scope: !163)
!167 = !DILocation(line: 102, column: 5, scope: !163)
!168 = !DILocation(line: 103, column: 12, scope: !156)
!169 = !DILocation(line: 103, column: 5, scope: !156)
