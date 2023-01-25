; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_21.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_21.c"
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_21_bad() #0 !dbg !20 {
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
  %call2 = call i32* @wcscat(i32* %arraydecay1, i32* %2) #5, !dbg !47
  %3 = load i32*, i32** %data, align 8, !dbg !48
  call void @printWLine(i32* %3), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !51 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %0 = load i32, i32* @badStatic, align 4, !dbg !56
  %tobool = icmp ne i32 %0, 0, !dbg !56
  br i1 %tobool, label %if.then, label %if.end, !dbg !58

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !59
  %call = call i32* @wmemset(i32* %1, i32 65, i64 99) #5, !dbg !61
  %2 = load i32*, i32** %data.addr, align 8, !dbg !62
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !62
  store i32 0, i32* %arrayidx, align 4, !dbg !63
  br label %if.end, !dbg !64

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !65
  ret i32* %3, !dbg !66
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscat(i32*, i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_21_good() #0 !dbg !67 {
entry:
  call void @goodG2B1(), !dbg !68
  call void @goodG2B2(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* null) #5, !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 %conv) #5, !dbg !83
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_21_good(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_21_bad(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !91 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !96
  store i32* %arraydecay, i32** %data, align 8, !dbg !97
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !98
  %0 = load i32*, i32** %data, align 8, !dbg !99
  %call = call i32* @goodG2B1Source(i32* %0), !dbg !100
  store i32* %call, i32** %data, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !102, metadata !DIExpression()), !dbg !104
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !104
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !105
  %2 = load i32*, i32** %data, align 8, !dbg !106
  %call2 = call i32* @wcscat(i32* %arraydecay1, i32* %2) #5, !dbg !107
  %3 = load i32*, i32** %data, align 8, !dbg !108
  call void @printWLine(i32* %3), !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B1Source(i32* %data) #0 !dbg !111 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !112, metadata !DIExpression()), !dbg !113
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !114
  %tobool = icmp ne i32 %0, 0, !dbg !114
  br i1 %tobool, label %if.then, label %if.else, !dbg !116

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !117
  br label %if.end, !dbg !119

if.else:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !120
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #5, !dbg !122
  %2 = load i32*, i32** %data.addr, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !123
  store i32 0, i32* %arrayidx, align 4, !dbg !124
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !125
  ret i32* %3, !dbg !126
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !127 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !128, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !130, metadata !DIExpression()), !dbg !131
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !132
  store i32* %arraydecay, i32** %data, align 8, !dbg !133
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !134
  %0 = load i32*, i32** %data, align 8, !dbg !135
  %call = call i32* @goodG2B2Source(i32* %0), !dbg !136
  store i32* %call, i32** %data, align 8, !dbg !137
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !138, metadata !DIExpression()), !dbg !140
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !140
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !140
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !141
  %2 = load i32*, i32** %data, align 8, !dbg !142
  %call2 = call i32* @wcscat(i32* %arraydecay1, i32* %2) #5, !dbg !143
  %3 = load i32*, i32** %data, align 8, !dbg !144
  call void @printWLine(i32* %3), !dbg !145
  ret void, !dbg !146
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B2Source(i32* %data) #0 !dbg !147 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !148, metadata !DIExpression()), !dbg !149
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !150
  %tobool = icmp ne i32 %0, 0, !dbg !150
  br i1 %tobool, label %if.then, label %if.end, !dbg !152

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !153
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #5, !dbg !155
  %2 = load i32*, i32** %data.addr, align 8, !dbg !156
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !156
  store i32 0, i32* %arrayidx, align 4, !dbg !157
  br label %if.end, !dbg !158

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !159
  ret i32* %3, !dbg !160
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !10, line: 24, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !10, line: 57, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_21.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !10, line: 58, type: !11, isLocal: true, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_21_bad", scope: !10, file: !10, line: 37, type: !21, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
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
!45 = !DILocation(line: 47, column: 16, scope: !40)
!46 = !DILocation(line: 47, column: 22, scope: !40)
!47 = !DILocation(line: 47, column: 9, scope: !40)
!48 = !DILocation(line: 48, column: 20, scope: !40)
!49 = !DILocation(line: 48, column: 9, scope: !40)
!50 = !DILocation(line: 50, column: 1, scope: !20)
!51 = distinct !DISubprogram(name: "badSource", scope: !10, file: !10, line: 26, type: !52, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!52 = !DISubroutineType(types: !53)
!53 = !{!24, !24}
!54 = !DILocalVariable(name: "data", arg: 1, scope: !51, file: !10, line: 26, type: !24)
!55 = !DILocation(line: 26, column: 38, scope: !51)
!56 = !DILocation(line: 28, column: 8, scope: !57)
!57 = distinct !DILexicalBlock(scope: !51, file: !10, line: 28, column: 8)
!58 = !DILocation(line: 28, column: 8, scope: !51)
!59 = !DILocation(line: 31, column: 17, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !10, line: 29, column: 5)
!61 = !DILocation(line: 31, column: 9, scope: !60)
!62 = !DILocation(line: 32, column: 9, scope: !60)
!63 = !DILocation(line: 32, column: 21, scope: !60)
!64 = !DILocation(line: 33, column: 5, scope: !60)
!65 = !DILocation(line: 34, column: 12, scope: !51)
!66 = !DILocation(line: 34, column: 5, scope: !51)
!67 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_21_good", scope: !10, file: !10, line: 119, type: !21, scopeLine: 120, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!68 = !DILocation(line: 121, column: 5, scope: !67)
!69 = !DILocation(line: 122, column: 5, scope: !67)
!70 = !DILocation(line: 123, column: 1, scope: !67)
!71 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 135, type: !72, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!72 = !DISubroutineType(types: !73)
!73 = !{!11, !11, !74}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !10, line: 135, type: !11)
!78 = !DILocation(line: 135, column: 14, scope: !71)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !10, line: 135, type: !74)
!80 = !DILocation(line: 135, column: 27, scope: !71)
!81 = !DILocation(line: 138, column: 22, scope: !71)
!82 = !DILocation(line: 138, column: 12, scope: !71)
!83 = !DILocation(line: 138, column: 5, scope: !71)
!84 = !DILocation(line: 140, column: 5, scope: !71)
!85 = !DILocation(line: 141, column: 5, scope: !71)
!86 = !DILocation(line: 142, column: 5, scope: !71)
!87 = !DILocation(line: 145, column: 5, scope: !71)
!88 = !DILocation(line: 146, column: 5, scope: !71)
!89 = !DILocation(line: 147, column: 5, scope: !71)
!90 = !DILocation(line: 149, column: 5, scope: !71)
!91 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 77, type: !21, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!92 = !DILocalVariable(name: "data", scope: !91, file: !10, line: 79, type: !24)
!93 = !DILocation(line: 79, column: 15, scope: !91)
!94 = !DILocalVariable(name: "dataBuffer", scope: !91, file: !10, line: 80, type: !29)
!95 = !DILocation(line: 80, column: 13, scope: !91)
!96 = !DILocation(line: 81, column: 12, scope: !91)
!97 = !DILocation(line: 81, column: 10, scope: !91)
!98 = !DILocation(line: 82, column: 20, scope: !91)
!99 = !DILocation(line: 83, column: 27, scope: !91)
!100 = !DILocation(line: 83, column: 12, scope: !91)
!101 = !DILocation(line: 83, column: 10, scope: !91)
!102 = !DILocalVariable(name: "dest", scope: !103, file: !10, line: 85, type: !41)
!103 = distinct !DILexicalBlock(scope: !91, file: !10, line: 84, column: 5)
!104 = !DILocation(line: 85, column: 17, scope: !103)
!105 = !DILocation(line: 87, column: 16, scope: !103)
!106 = !DILocation(line: 87, column: 22, scope: !103)
!107 = !DILocation(line: 87, column: 9, scope: !103)
!108 = !DILocation(line: 88, column: 20, scope: !103)
!109 = !DILocation(line: 88, column: 9, scope: !103)
!110 = !DILocation(line: 90, column: 1, scope: !91)
!111 = distinct !DISubprogram(name: "goodG2B1Source", scope: !10, file: !10, line: 61, type: !52, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!112 = !DILocalVariable(name: "data", arg: 1, scope: !111, file: !10, line: 61, type: !24)
!113 = !DILocation(line: 61, column: 43, scope: !111)
!114 = !DILocation(line: 63, column: 8, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !10, line: 63, column: 8)
!116 = !DILocation(line: 63, column: 8, scope: !111)
!117 = !DILocation(line: 66, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !10, line: 64, column: 5)
!119 = !DILocation(line: 67, column: 5, scope: !118)
!120 = !DILocation(line: 71, column: 17, scope: !121)
!121 = distinct !DILexicalBlock(scope: !115, file: !10, line: 69, column: 5)
!122 = !DILocation(line: 71, column: 9, scope: !121)
!123 = !DILocation(line: 72, column: 9, scope: !121)
!124 = !DILocation(line: 72, column: 20, scope: !121)
!125 = !DILocation(line: 74, column: 12, scope: !111)
!126 = !DILocation(line: 74, column: 5, scope: !111)
!127 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 104, type: !21, scopeLine: 105, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!128 = !DILocalVariable(name: "data", scope: !127, file: !10, line: 106, type: !24)
!129 = !DILocation(line: 106, column: 15, scope: !127)
!130 = !DILocalVariable(name: "dataBuffer", scope: !127, file: !10, line: 107, type: !29)
!131 = !DILocation(line: 107, column: 13, scope: !127)
!132 = !DILocation(line: 108, column: 12, scope: !127)
!133 = !DILocation(line: 108, column: 10, scope: !127)
!134 = !DILocation(line: 109, column: 20, scope: !127)
!135 = !DILocation(line: 110, column: 27, scope: !127)
!136 = !DILocation(line: 110, column: 12, scope: !127)
!137 = !DILocation(line: 110, column: 10, scope: !127)
!138 = !DILocalVariable(name: "dest", scope: !139, file: !10, line: 112, type: !41)
!139 = distinct !DILexicalBlock(scope: !127, file: !10, line: 111, column: 5)
!140 = !DILocation(line: 112, column: 17, scope: !139)
!141 = !DILocation(line: 114, column: 16, scope: !139)
!142 = !DILocation(line: 114, column: 22, scope: !139)
!143 = !DILocation(line: 114, column: 9, scope: !139)
!144 = !DILocation(line: 115, column: 20, scope: !139)
!145 = !DILocation(line: 115, column: 9, scope: !139)
!146 = !DILocation(line: 117, column: 1, scope: !127)
!147 = distinct !DISubprogram(name: "goodG2B2Source", scope: !10, file: !10, line: 93, type: !52, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!148 = !DILocalVariable(name: "data", arg: 1, scope: !147, file: !10, line: 93, type: !24)
!149 = !DILocation(line: 93, column: 43, scope: !147)
!150 = !DILocation(line: 95, column: 8, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !10, line: 95, column: 8)
!152 = !DILocation(line: 95, column: 8, scope: !147)
!153 = !DILocation(line: 98, column: 17, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !10, line: 96, column: 5)
!155 = !DILocation(line: 98, column: 9, scope: !154)
!156 = !DILocation(line: 99, column: 9, scope: !154)
!157 = !DILocation(line: 99, column: 20, scope: !154)
!158 = !DILocation(line: 100, column: 5, scope: !154)
!159 = !DILocation(line: 101, column: 12, scope: !147)
!160 = !DILocation(line: 101, column: 5, scope: !147)
