; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_21.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_21.c"
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_21_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !33
  store i32* %arraydecay, i32** %data, align 8, !dbg !34
  store i32 1, i32* @badStatic, align 4, !dbg !35
  %0 = load i32*, i32** %data, align 8, !dbg !36
  %call = call i32* @badSource(i32* %0), !dbg !37
  store i32* %call, i32** %data, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !39, metadata !DIExpression()), !dbg !44
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !44
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !45
  %2 = load i32*, i32** %data, align 8, !dbg !46
  %3 = load i32*, i32** %data, align 8, !dbg !47
  %call2 = call i64 @wcslen(i32* %3) #6, !dbg !48
  %call3 = call i32* @wcsncat(i32* %arraydecay1, i32* %2, i64 %call2) #7, !dbg !49
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !50
  store i32 0, i32* %arrayidx, align 4, !dbg !51
  %4 = load i32*, i32** %data, align 8, !dbg !52
  call void @printWLine(i32* %4), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !55 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %0 = load i32, i32* @badStatic, align 4, !dbg !60
  %tobool = icmp ne i32 %0, 0, !dbg !60
  br i1 %tobool, label %if.then, label %if.end, !dbg !62

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !63
  %call = call i32* @wmemset(i32* %1, i32 65, i64 99) #7, !dbg !65
  %2 = load i32*, i32** %data.addr, align 8, !dbg !66
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !66
  store i32 0, i32* %arrayidx, align 4, !dbg !67
  br label %if.end, !dbg !68

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !69
  ret i32* %3, !dbg !70
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncat(i32*, i32*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_21_good() #0 !dbg !71 {
entry:
  call void @goodG2B1(), !dbg !72
  call void @goodG2B2(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !75 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* null) #7, !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 %conv) #7, !dbg !87
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_21_good(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_21_bad(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !95 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !100
  store i32* %arraydecay, i32** %data, align 8, !dbg !101
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !102
  %0 = load i32*, i32** %data, align 8, !dbg !103
  %call = call i32* @goodG2B1Source(i32* %0), !dbg !104
  store i32* %call, i32** %data, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !106, metadata !DIExpression()), !dbg !108
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !108
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !109
  %2 = load i32*, i32** %data, align 8, !dbg !110
  %3 = load i32*, i32** %data, align 8, !dbg !111
  %call2 = call i64 @wcslen(i32* %3) #6, !dbg !112
  %call3 = call i32* @wcsncat(i32* %arraydecay1, i32* %2, i64 %call2) #7, !dbg !113
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !114
  store i32 0, i32* %arrayidx, align 4, !dbg !115
  %4 = load i32*, i32** %data, align 8, !dbg !116
  call void @printWLine(i32* %4), !dbg !117
  ret void, !dbg !118
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B1Source(i32* %data) #0 !dbg !119 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !120, metadata !DIExpression()), !dbg !121
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !122
  %tobool = icmp ne i32 %0, 0, !dbg !122
  br i1 %tobool, label %if.then, label %if.else, !dbg !124

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !125
  br label %if.end, !dbg !127

if.else:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !128
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #7, !dbg !130
  %2 = load i32*, i32** %data.addr, align 8, !dbg !131
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !131
  store i32 0, i32* %arrayidx, align 4, !dbg !132
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !133
  ret i32* %3, !dbg !134
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !135 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !138, metadata !DIExpression()), !dbg !139
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !140
  store i32* %arraydecay, i32** %data, align 8, !dbg !141
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !142
  %0 = load i32*, i32** %data, align 8, !dbg !143
  %call = call i32* @goodG2B2Source(i32* %0), !dbg !144
  store i32* %call, i32** %data, align 8, !dbg !145
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !146, metadata !DIExpression()), !dbg !148
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !148
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !148
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !149
  %2 = load i32*, i32** %data, align 8, !dbg !150
  %3 = load i32*, i32** %data, align 8, !dbg !151
  %call2 = call i64 @wcslen(i32* %3) #6, !dbg !152
  %call3 = call i32* @wcsncat(i32* %arraydecay1, i32* %2, i64 %call2) #7, !dbg !153
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !154
  store i32 0, i32* %arrayidx, align 4, !dbg !155
  %4 = load i32*, i32** %data, align 8, !dbg !156
  call void @printWLine(i32* %4), !dbg !157
  ret void, !dbg !158
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B2Source(i32* %data) #0 !dbg !159 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !160, metadata !DIExpression()), !dbg !161
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !162
  %tobool = icmp ne i32 %0, 0, !dbg !162
  br i1 %tobool, label %if.then, label %if.end, !dbg !164

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !165
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #7, !dbg !167
  %2 = load i32*, i32** %data.addr, align 8, !dbg !168
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !168
  store i32 0, i32* %arrayidx, align 4, !dbg !169
  br label %if.end, !dbg !170

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !171
  ret i32* %3, !dbg !172
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
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !10, line: 58, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_21.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !10, line: 59, type: !11, isLocal: true, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_21_bad", scope: !10, file: !10, line: 37, type: !21, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 39, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !26, line: 74, baseType: !11)
!26 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!27 = !DILocation(line: 39, column: 15, scope: !20)
!28 = !DILocalVariable(name: "dataBuffer", scope: !20, file: !10, line: 40, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 3200, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 40, column: 13, scope: !20)
!33 = !DILocation(line: 41, column: 12, scope: !20)
!34 = !DILocation(line: 41, column: 10, scope: !20)
!35 = !DILocation(line: 42, column: 15, scope: !20)
!36 = !DILocation(line: 43, column: 22, scope: !20)
!37 = !DILocation(line: 43, column: 12, scope: !20)
!38 = !DILocation(line: 43, column: 10, scope: !20)
!39 = !DILocalVariable(name: "dest", scope: !40, file: !10, line: 45, type: !41)
!40 = distinct !DILexicalBlock(scope: !20, file: !10, line: 44, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 1600, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 50)
!44 = !DILocation(line: 45, column: 17, scope: !40)
!45 = !DILocation(line: 47, column: 17, scope: !40)
!46 = !DILocation(line: 47, column: 23, scope: !40)
!47 = !DILocation(line: 47, column: 36, scope: !40)
!48 = !DILocation(line: 47, column: 29, scope: !40)
!49 = !DILocation(line: 47, column: 9, scope: !40)
!50 = !DILocation(line: 48, column: 9, scope: !40)
!51 = !DILocation(line: 48, column: 20, scope: !40)
!52 = !DILocation(line: 49, column: 20, scope: !40)
!53 = !DILocation(line: 49, column: 9, scope: !40)
!54 = !DILocation(line: 51, column: 1, scope: !20)
!55 = distinct !DISubprogram(name: "badSource", scope: !10, file: !10, line: 26, type: !56, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DISubroutineType(types: !57)
!57 = !{!24, !24}
!58 = !DILocalVariable(name: "data", arg: 1, scope: !55, file: !10, line: 26, type: !24)
!59 = !DILocation(line: 26, column: 38, scope: !55)
!60 = !DILocation(line: 28, column: 8, scope: !61)
!61 = distinct !DILexicalBlock(scope: !55, file: !10, line: 28, column: 8)
!62 = !DILocation(line: 28, column: 8, scope: !55)
!63 = !DILocation(line: 31, column: 17, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !10, line: 29, column: 5)
!65 = !DILocation(line: 31, column: 9, scope: !64)
!66 = !DILocation(line: 32, column: 9, scope: !64)
!67 = !DILocation(line: 32, column: 21, scope: !64)
!68 = !DILocation(line: 33, column: 5, scope: !64)
!69 = !DILocation(line: 34, column: 12, scope: !55)
!70 = !DILocation(line: 34, column: 5, scope: !55)
!71 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncat_21_good", scope: !10, file: !10, line: 122, type: !21, scopeLine: 123, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!72 = !DILocation(line: 124, column: 5, scope: !71)
!73 = !DILocation(line: 125, column: 5, scope: !71)
!74 = !DILocation(line: 126, column: 1, scope: !71)
!75 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 138, type: !76, scopeLine: 139, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!76 = !DISubroutineType(types: !77)
!77 = !{!11, !11, !78}
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !10, line: 138, type: !11)
!82 = !DILocation(line: 138, column: 14, scope: !75)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !10, line: 138, type: !78)
!84 = !DILocation(line: 138, column: 27, scope: !75)
!85 = !DILocation(line: 141, column: 22, scope: !75)
!86 = !DILocation(line: 141, column: 12, scope: !75)
!87 = !DILocation(line: 141, column: 5, scope: !75)
!88 = !DILocation(line: 143, column: 5, scope: !75)
!89 = !DILocation(line: 144, column: 5, scope: !75)
!90 = !DILocation(line: 145, column: 5, scope: !75)
!91 = !DILocation(line: 148, column: 5, scope: !75)
!92 = !DILocation(line: 149, column: 5, scope: !75)
!93 = !DILocation(line: 150, column: 5, scope: !75)
!94 = !DILocation(line: 152, column: 5, scope: !75)
!95 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 78, type: !21, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!96 = !DILocalVariable(name: "data", scope: !95, file: !10, line: 80, type: !24)
!97 = !DILocation(line: 80, column: 15, scope: !95)
!98 = !DILocalVariable(name: "dataBuffer", scope: !95, file: !10, line: 81, type: !29)
!99 = !DILocation(line: 81, column: 13, scope: !95)
!100 = !DILocation(line: 82, column: 12, scope: !95)
!101 = !DILocation(line: 82, column: 10, scope: !95)
!102 = !DILocation(line: 83, column: 20, scope: !95)
!103 = !DILocation(line: 84, column: 27, scope: !95)
!104 = !DILocation(line: 84, column: 12, scope: !95)
!105 = !DILocation(line: 84, column: 10, scope: !95)
!106 = !DILocalVariable(name: "dest", scope: !107, file: !10, line: 86, type: !41)
!107 = distinct !DILexicalBlock(scope: !95, file: !10, line: 85, column: 5)
!108 = !DILocation(line: 86, column: 17, scope: !107)
!109 = !DILocation(line: 88, column: 17, scope: !107)
!110 = !DILocation(line: 88, column: 23, scope: !107)
!111 = !DILocation(line: 88, column: 36, scope: !107)
!112 = !DILocation(line: 88, column: 29, scope: !107)
!113 = !DILocation(line: 88, column: 9, scope: !107)
!114 = !DILocation(line: 89, column: 9, scope: !107)
!115 = !DILocation(line: 89, column: 20, scope: !107)
!116 = !DILocation(line: 90, column: 20, scope: !107)
!117 = !DILocation(line: 90, column: 9, scope: !107)
!118 = !DILocation(line: 92, column: 1, scope: !95)
!119 = distinct !DISubprogram(name: "goodG2B1Source", scope: !10, file: !10, line: 62, type: !56, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!120 = !DILocalVariable(name: "data", arg: 1, scope: !119, file: !10, line: 62, type: !24)
!121 = !DILocation(line: 62, column: 43, scope: !119)
!122 = !DILocation(line: 64, column: 8, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !10, line: 64, column: 8)
!124 = !DILocation(line: 64, column: 8, scope: !119)
!125 = !DILocation(line: 67, column: 9, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !10, line: 65, column: 5)
!127 = !DILocation(line: 68, column: 5, scope: !126)
!128 = !DILocation(line: 72, column: 17, scope: !129)
!129 = distinct !DILexicalBlock(scope: !123, file: !10, line: 70, column: 5)
!130 = !DILocation(line: 72, column: 9, scope: !129)
!131 = !DILocation(line: 73, column: 9, scope: !129)
!132 = !DILocation(line: 73, column: 20, scope: !129)
!133 = !DILocation(line: 75, column: 12, scope: !119)
!134 = !DILocation(line: 75, column: 5, scope: !119)
!135 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 106, type: !21, scopeLine: 107, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!136 = !DILocalVariable(name: "data", scope: !135, file: !10, line: 108, type: !24)
!137 = !DILocation(line: 108, column: 15, scope: !135)
!138 = !DILocalVariable(name: "dataBuffer", scope: !135, file: !10, line: 109, type: !29)
!139 = !DILocation(line: 109, column: 13, scope: !135)
!140 = !DILocation(line: 110, column: 12, scope: !135)
!141 = !DILocation(line: 110, column: 10, scope: !135)
!142 = !DILocation(line: 111, column: 20, scope: !135)
!143 = !DILocation(line: 112, column: 27, scope: !135)
!144 = !DILocation(line: 112, column: 12, scope: !135)
!145 = !DILocation(line: 112, column: 10, scope: !135)
!146 = !DILocalVariable(name: "dest", scope: !147, file: !10, line: 114, type: !41)
!147 = distinct !DILexicalBlock(scope: !135, file: !10, line: 113, column: 5)
!148 = !DILocation(line: 114, column: 17, scope: !147)
!149 = !DILocation(line: 116, column: 17, scope: !147)
!150 = !DILocation(line: 116, column: 23, scope: !147)
!151 = !DILocation(line: 116, column: 36, scope: !147)
!152 = !DILocation(line: 116, column: 29, scope: !147)
!153 = !DILocation(line: 116, column: 9, scope: !147)
!154 = !DILocation(line: 117, column: 9, scope: !147)
!155 = !DILocation(line: 117, column: 20, scope: !147)
!156 = !DILocation(line: 118, column: 20, scope: !147)
!157 = !DILocation(line: 118, column: 9, scope: !147)
!158 = !DILocation(line: 120, column: 1, scope: !135)
!159 = distinct !DISubprogram(name: "goodG2B2Source", scope: !10, file: !10, line: 95, type: !56, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!160 = !DILocalVariable(name: "data", arg: 1, scope: !159, file: !10, line: 95, type: !24)
!161 = !DILocation(line: 95, column: 43, scope: !159)
!162 = !DILocation(line: 97, column: 8, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !10, line: 97, column: 8)
!164 = !DILocation(line: 97, column: 8, scope: !159)
!165 = !DILocation(line: 100, column: 17, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !10, line: 98, column: 5)
!167 = !DILocation(line: 100, column: 9, scope: !166)
!168 = !DILocation(line: 101, column: 9, scope: !166)
!169 = !DILocation(line: 101, column: 20, scope: !166)
!170 = !DILocation(line: 102, column: 5, scope: !166)
!171 = !DILocation(line: 103, column: 12, scope: !159)
!172 = !DILocation(line: 103, column: 5, scope: !159)
