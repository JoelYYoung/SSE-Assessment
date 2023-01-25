; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_21.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !8
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !12

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_21_bad() #0 !dbg !20 {
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
  %call2 = call i64 @wcslen(i32* %2) #6, !dbg !47
  %3 = load i32*, i32** %data, align 8, !dbg !48
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay1, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %3) #7, !dbg !49
  %4 = load i32*, i32** %data, align 8, !dbg !50
  call void @printWLine(i32* %4), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !53 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %0 = load i32, i32* @badStatic, align 4, !dbg !58
  %tobool = icmp ne i32 %0, 0, !dbg !58
  br i1 %tobool, label %if.then, label %if.end, !dbg !60

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !61
  %call = call i32* @wmemset(i32* %1, i32 65, i64 99) #7, !dbg !63
  %2 = load i32*, i32** %data.addr, align 8, !dbg !64
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !64
  store i32 0, i32* %arrayidx, align 4, !dbg !65
  br label %if.end, !dbg !66

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !67
  ret i32* %3, !dbg !68
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_21_good() #0 !dbg !69 {
entry:
  call void @goodG2B1(), !dbg !70
  call void @goodG2B2(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* null) #7, !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 %conv) #7, !dbg !85
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_21_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_21_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !93 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !98
  store i32* %arraydecay, i32** %data, align 8, !dbg !99
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !100
  %0 = load i32*, i32** %data, align 8, !dbg !101
  %call = call i32* @goodG2B1Source(i32* %0), !dbg !102
  store i32* %call, i32** %data, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !104, metadata !DIExpression()), !dbg !106
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !106
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !107
  %2 = load i32*, i32** %data, align 8, !dbg !108
  %call2 = call i64 @wcslen(i32* %2) #6, !dbg !109
  %3 = load i32*, i32** %data, align 8, !dbg !110
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay1, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %3) #7, !dbg !111
  %4 = load i32*, i32** %data, align 8, !dbg !112
  call void @printWLine(i32* %4), !dbg !113
  ret void, !dbg !114
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B1Source(i32* %data) #0 !dbg !115 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !116, metadata !DIExpression()), !dbg !117
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !118
  %tobool = icmp ne i32 %0, 0, !dbg !118
  br i1 %tobool, label %if.then, label %if.else, !dbg !120

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !121
  br label %if.end, !dbg !123

if.else:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !124
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #7, !dbg !126
  %2 = load i32*, i32** %data.addr, align 8, !dbg !127
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !127
  store i32 0, i32* %arrayidx, align 4, !dbg !128
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !129
  ret i32* %3, !dbg !130
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !131 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !132, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !134, metadata !DIExpression()), !dbg !135
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !136
  store i32* %arraydecay, i32** %data, align 8, !dbg !137
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !138
  %0 = load i32*, i32** %data, align 8, !dbg !139
  %call = call i32* @goodG2B2Source(i32* %0), !dbg !140
  store i32* %call, i32** %data, align 8, !dbg !141
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !142, metadata !DIExpression()), !dbg !144
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !144
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !144
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !145
  %2 = load i32*, i32** %data, align 8, !dbg !146
  %call2 = call i64 @wcslen(i32* %2) #6, !dbg !147
  %3 = load i32*, i32** %data, align 8, !dbg !148
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay1, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %3) #7, !dbg !149
  %4 = load i32*, i32** %data, align 8, !dbg !150
  call void @printWLine(i32* %4), !dbg !151
  ret void, !dbg !152
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B2Source(i32* %data) #0 !dbg !153 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !154, metadata !DIExpression()), !dbg !155
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !156
  %tobool = icmp ne i32 %0, 0, !dbg !156
  br i1 %tobool, label %if.then, label %if.end, !dbg !158

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !159
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #7, !dbg !161
  %2 = load i32*, i32** %data.addr, align 8, !dbg !162
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !162
  store i32 0, i32* %arrayidx, align 4, !dbg !163
  br label %if.end, !dbg !164

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !165
  ret i32* %3, !dbg !166
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
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !10, line: 30, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !10, line: 63, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_21.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !10, line: 64, type: !11, isLocal: true, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_21_bad", scope: !10, file: !10, line: 43, type: !21, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 45, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !26, line: 74, baseType: !11)
!26 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!27 = !DILocation(line: 45, column: 15, scope: !20)
!28 = !DILocalVariable(name: "dataBuffer", scope: !20, file: !10, line: 46, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 3200, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 46, column: 13, scope: !20)
!33 = !DILocation(line: 47, column: 12, scope: !20)
!34 = !DILocation(line: 47, column: 10, scope: !20)
!35 = !DILocation(line: 48, column: 15, scope: !20)
!36 = !DILocation(line: 49, column: 22, scope: !20)
!37 = !DILocation(line: 49, column: 12, scope: !20)
!38 = !DILocation(line: 49, column: 10, scope: !20)
!39 = !DILocalVariable(name: "dest", scope: !40, file: !10, line: 51, type: !41)
!40 = distinct !DILexicalBlock(scope: !20, file: !10, line: 50, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 1600, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 50)
!44 = !DILocation(line: 51, column: 17, scope: !40)
!45 = !DILocation(line: 53, column: 18, scope: !40)
!46 = !DILocation(line: 53, column: 31, scope: !40)
!47 = !DILocation(line: 53, column: 24, scope: !40)
!48 = !DILocation(line: 53, column: 45, scope: !40)
!49 = !DILocation(line: 53, column: 9, scope: !40)
!50 = !DILocation(line: 54, column: 20, scope: !40)
!51 = !DILocation(line: 54, column: 9, scope: !40)
!52 = !DILocation(line: 56, column: 1, scope: !20)
!53 = distinct !DISubprogram(name: "badSource", scope: !10, file: !10, line: 32, type: !54, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DISubroutineType(types: !55)
!55 = !{!24, !24}
!56 = !DILocalVariable(name: "data", arg: 1, scope: !53, file: !10, line: 32, type: !24)
!57 = !DILocation(line: 32, column: 38, scope: !53)
!58 = !DILocation(line: 34, column: 8, scope: !59)
!59 = distinct !DILexicalBlock(scope: !53, file: !10, line: 34, column: 8)
!60 = !DILocation(line: 34, column: 8, scope: !53)
!61 = !DILocation(line: 37, column: 17, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !10, line: 35, column: 5)
!63 = !DILocation(line: 37, column: 9, scope: !62)
!64 = !DILocation(line: 38, column: 9, scope: !62)
!65 = !DILocation(line: 38, column: 21, scope: !62)
!66 = !DILocation(line: 39, column: 5, scope: !62)
!67 = !DILocation(line: 40, column: 12, scope: !53)
!68 = !DILocation(line: 40, column: 5, scope: !53)
!69 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_21_good", scope: !10, file: !10, line: 125, type: !21, scopeLine: 126, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!70 = !DILocation(line: 127, column: 5, scope: !69)
!71 = !DILocation(line: 128, column: 5, scope: !69)
!72 = !DILocation(line: 129, column: 1, scope: !69)
!73 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 141, type: !74, scopeLine: 142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!74 = !DISubroutineType(types: !75)
!75 = !{!11, !11, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !10, line: 141, type: !11)
!80 = !DILocation(line: 141, column: 14, scope: !73)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !10, line: 141, type: !76)
!82 = !DILocation(line: 141, column: 27, scope: !73)
!83 = !DILocation(line: 144, column: 22, scope: !73)
!84 = !DILocation(line: 144, column: 12, scope: !73)
!85 = !DILocation(line: 144, column: 5, scope: !73)
!86 = !DILocation(line: 146, column: 5, scope: !73)
!87 = !DILocation(line: 147, column: 5, scope: !73)
!88 = !DILocation(line: 148, column: 5, scope: !73)
!89 = !DILocation(line: 151, column: 5, scope: !73)
!90 = !DILocation(line: 152, column: 5, scope: !73)
!91 = !DILocation(line: 153, column: 5, scope: !73)
!92 = !DILocation(line: 155, column: 5, scope: !73)
!93 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 83, type: !21, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!94 = !DILocalVariable(name: "data", scope: !93, file: !10, line: 85, type: !24)
!95 = !DILocation(line: 85, column: 15, scope: !93)
!96 = !DILocalVariable(name: "dataBuffer", scope: !93, file: !10, line: 86, type: !29)
!97 = !DILocation(line: 86, column: 13, scope: !93)
!98 = !DILocation(line: 87, column: 12, scope: !93)
!99 = !DILocation(line: 87, column: 10, scope: !93)
!100 = !DILocation(line: 88, column: 20, scope: !93)
!101 = !DILocation(line: 89, column: 27, scope: !93)
!102 = !DILocation(line: 89, column: 12, scope: !93)
!103 = !DILocation(line: 89, column: 10, scope: !93)
!104 = !DILocalVariable(name: "dest", scope: !105, file: !10, line: 91, type: !41)
!105 = distinct !DILexicalBlock(scope: !93, file: !10, line: 90, column: 5)
!106 = !DILocation(line: 91, column: 17, scope: !105)
!107 = !DILocation(line: 93, column: 18, scope: !105)
!108 = !DILocation(line: 93, column: 31, scope: !105)
!109 = !DILocation(line: 93, column: 24, scope: !105)
!110 = !DILocation(line: 93, column: 45, scope: !105)
!111 = !DILocation(line: 93, column: 9, scope: !105)
!112 = !DILocation(line: 94, column: 20, scope: !105)
!113 = !DILocation(line: 94, column: 9, scope: !105)
!114 = !DILocation(line: 96, column: 1, scope: !93)
!115 = distinct !DISubprogram(name: "goodG2B1Source", scope: !10, file: !10, line: 67, type: !54, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!116 = !DILocalVariable(name: "data", arg: 1, scope: !115, file: !10, line: 67, type: !24)
!117 = !DILocation(line: 67, column: 43, scope: !115)
!118 = !DILocation(line: 69, column: 8, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !10, line: 69, column: 8)
!120 = !DILocation(line: 69, column: 8, scope: !115)
!121 = !DILocation(line: 72, column: 9, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !10, line: 70, column: 5)
!123 = !DILocation(line: 73, column: 5, scope: !122)
!124 = !DILocation(line: 77, column: 17, scope: !125)
!125 = distinct !DILexicalBlock(scope: !119, file: !10, line: 75, column: 5)
!126 = !DILocation(line: 77, column: 9, scope: !125)
!127 = !DILocation(line: 78, column: 9, scope: !125)
!128 = !DILocation(line: 78, column: 20, scope: !125)
!129 = !DILocation(line: 80, column: 12, scope: !115)
!130 = !DILocation(line: 80, column: 5, scope: !115)
!131 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 110, type: !21, scopeLine: 111, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!132 = !DILocalVariable(name: "data", scope: !131, file: !10, line: 112, type: !24)
!133 = !DILocation(line: 112, column: 15, scope: !131)
!134 = !DILocalVariable(name: "dataBuffer", scope: !131, file: !10, line: 113, type: !29)
!135 = !DILocation(line: 113, column: 13, scope: !131)
!136 = !DILocation(line: 114, column: 12, scope: !131)
!137 = !DILocation(line: 114, column: 10, scope: !131)
!138 = !DILocation(line: 115, column: 20, scope: !131)
!139 = !DILocation(line: 116, column: 27, scope: !131)
!140 = !DILocation(line: 116, column: 12, scope: !131)
!141 = !DILocation(line: 116, column: 10, scope: !131)
!142 = !DILocalVariable(name: "dest", scope: !143, file: !10, line: 118, type: !41)
!143 = distinct !DILexicalBlock(scope: !131, file: !10, line: 117, column: 5)
!144 = !DILocation(line: 118, column: 17, scope: !143)
!145 = !DILocation(line: 120, column: 18, scope: !143)
!146 = !DILocation(line: 120, column: 31, scope: !143)
!147 = !DILocation(line: 120, column: 24, scope: !143)
!148 = !DILocation(line: 120, column: 45, scope: !143)
!149 = !DILocation(line: 120, column: 9, scope: !143)
!150 = !DILocation(line: 121, column: 20, scope: !143)
!151 = !DILocation(line: 121, column: 9, scope: !143)
!152 = !DILocation(line: 123, column: 1, scope: !131)
!153 = distinct !DISubprogram(name: "goodG2B2Source", scope: !10, file: !10, line: 99, type: !54, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!154 = !DILocalVariable(name: "data", arg: 1, scope: !153, file: !10, line: 99, type: !24)
!155 = !DILocation(line: 99, column: 43, scope: !153)
!156 = !DILocation(line: 101, column: 8, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !10, line: 101, column: 8)
!158 = !DILocation(line: 101, column: 8, scope: !153)
!159 = !DILocation(line: 104, column: 17, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !10, line: 102, column: 5)
!161 = !DILocation(line: 104, column: 9, scope: !160)
!162 = !DILocation(line: 105, column: 9, scope: !160)
!163 = !DILocation(line: 105, column: 20, scope: !160)
!164 = !DILocation(line: 106, column: 5, scope: !160)
!165 = !DILocation(line: 107, column: 12, scope: !153)
!166 = !DILocation(line: 107, column: 5, scope: !153)
