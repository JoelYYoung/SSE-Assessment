; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_21.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [43 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 4
@badStatic = internal global i32 0, align 4, !dbg !0
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodB2G1Static = internal global i32 0, align 4, !dbg !15
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodB2G2Static = internal global i32 0, align 4, !dbg !18
@.str.6 = private unnamed_addr constant [43 x i8] c"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\00", align 1
@goodG2BStatic = internal global i32 0, align 4, !dbg !20

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_21_bad() #0 !dbg !28 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !31, metadata !DIExpression()), !dbg !32
  store i8* null, i8** %data, align 8, !dbg !33
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !34
  store i32 1, i32* @badStatic, align 4, !dbg !35
  %0 = load i8*, i8** %data, align 8, !dbg !36
  call void @badSink(i8* %0), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !39 {
entry:
  %data.addr = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !42, metadata !DIExpression()), !dbg !43
  %0 = load i32, i32* @badStatic, align 4, !dbg !44
  %tobool = icmp ne i32 %0, 0, !dbg !44
  br i1 %tobool, label %if.then, label %if.end, !dbg !46

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !47, metadata !DIExpression()), !dbg !52
  %1 = load i8*, i8** %data.addr, align 8, !dbg !53
  %call = call i64 @strlen(i8* %1) #5, !dbg !54
  store i64 %call, i64* %dataLen, align 8, !dbg !52
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !55, metadata !DIExpression()), !dbg !56
  %2 = load i64, i64* %dataLen, align 8, !dbg !57
  %add = add i64 %2, 1, !dbg !57
  %mul = mul i64 %add, 4, !dbg !57
  %3 = alloca i8, i64 %mul, align 16, !dbg !57
  store i8* %3, i8** %dest, align 8, !dbg !56
  %4 = load i8*, i8** %dest, align 8, !dbg !58
  %5 = bitcast i8* %4 to i32*, !dbg !58
  %6 = load i8*, i8** %data.addr, align 8, !dbg !59
  %7 = bitcast i8* %6 to i32*, !dbg !59
  %call1 = call i32* @wcscpy(i32* %5, i32* %7) #6, !dbg !60
  %8 = load i8*, i8** %dest, align 8, !dbg !61
  call void @printLine(i8* %8), !dbg !62
  br label %if.end, !dbg !63

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_21_good() #0 !dbg !65 {
entry:
  call void @goodB2G1(), !dbg !66
  call void @goodB2G2(), !dbg !67
  call void @goodG2B(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !70 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* null) #6, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #6, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_21_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_21_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !88 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !89, metadata !DIExpression()), !dbg !90
  store i8* null, i8** %data, align 8, !dbg !91
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !92
  store i32 0, i32* @goodB2G1Static, align 4, !dbg !93
  %0 = load i8*, i8** %data, align 8, !dbg !94
  call void @goodB2G1Sink(i8* %0), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1Sink(i8* %data) #0 !dbg !97 {
entry:
  %data.addr = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !98, metadata !DIExpression()), !dbg !99
  %0 = load i32, i32* @goodB2G1Static, align 4, !dbg !100
  %tobool = icmp ne i32 %0, 0, !dbg !100
  br i1 %tobool, label %if.then, label %if.else, !dbg !102

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !103
  br label %if.end, !dbg !105

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !106, metadata !DIExpression()), !dbg !109
  %1 = load i8*, i8** %data.addr, align 8, !dbg !110
  %2 = bitcast i8* %1 to i32*, !dbg !111
  %call = call i64 @wcslen(i32* %2) #5, !dbg !112
  store i64 %call, i64* %dataLen, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !113, metadata !DIExpression()), !dbg !114
  %3 = load i64, i64* %dataLen, align 8, !dbg !115
  %add = add i64 %3, 1, !dbg !115
  %mul = mul i64 %add, 4, !dbg !115
  %4 = alloca i8, i64 %mul, align 16, !dbg !115
  store i8* %4, i8** %dest, align 8, !dbg !114
  %5 = load i8*, i8** %dest, align 8, !dbg !116
  %6 = bitcast i8* %5 to i32*, !dbg !116
  %7 = load i8*, i8** %data.addr, align 8, !dbg !117
  %8 = bitcast i8* %7 to i32*, !dbg !117
  %call1 = call i32* @wcscpy(i32* %6, i32* %8) #6, !dbg !118
  %9 = load i8*, i8** %dest, align 8, !dbg !119
  %10 = bitcast i8* %9 to i32*, !dbg !120
  call void @printWLine(i32* %10), !dbg !121
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !122
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !123 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !124, metadata !DIExpression()), !dbg !125
  store i8* null, i8** %data, align 8, !dbg !126
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !127
  store i32 1, i32* @goodB2G2Static, align 4, !dbg !128
  %0 = load i8*, i8** %data, align 8, !dbg !129
  call void @goodB2G2Sink(i8* %0), !dbg !130
  ret void, !dbg !131
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2Sink(i8* %data) #0 !dbg !132 {
entry:
  %data.addr = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !133, metadata !DIExpression()), !dbg !134
  %0 = load i32, i32* @goodB2G2Static, align 4, !dbg !135
  %tobool = icmp ne i32 %0, 0, !dbg !135
  br i1 %tobool, label %if.then, label %if.end, !dbg !137

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !138, metadata !DIExpression()), !dbg !141
  %1 = load i8*, i8** %data.addr, align 8, !dbg !142
  %2 = bitcast i8* %1 to i32*, !dbg !143
  %call = call i64 @wcslen(i32* %2) #5, !dbg !144
  store i64 %call, i64* %dataLen, align 8, !dbg !141
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !145, metadata !DIExpression()), !dbg !146
  %3 = load i64, i64* %dataLen, align 8, !dbg !147
  %add = add i64 %3, 1, !dbg !147
  %mul = mul i64 %add, 4, !dbg !147
  %4 = alloca i8, i64 %mul, align 16, !dbg !147
  store i8* %4, i8** %dest, align 8, !dbg !146
  %5 = load i8*, i8** %dest, align 8, !dbg !148
  %6 = bitcast i8* %5 to i32*, !dbg !148
  %7 = load i8*, i8** %data.addr, align 8, !dbg !149
  %8 = bitcast i8* %7 to i32*, !dbg !149
  %call1 = call i32* @wcscpy(i32* %6, i32* %8) #6, !dbg !150
  %9 = load i8*, i8** %dest, align 8, !dbg !151
  %10 = bitcast i8* %9 to i32*, !dbg !152
  call void @printWLine(i32* %10), !dbg !153
  br label %if.end, !dbg !154

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !155
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !156 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !157, metadata !DIExpression()), !dbg !158
  store i8* null, i8** %data, align 8, !dbg !159
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.6, i64 0, i64 0), i8** %data, align 8, !dbg !160
  store i32 1, i32* @goodG2BStatic, align 4, !dbg !161
  %0 = load i8*, i8** %data, align 8, !dbg !162
  call void @goodG2BSink(i8* %0), !dbg !163
  ret void, !dbg !164
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !165 {
entry:
  %data.addr = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !166, metadata !DIExpression()), !dbg !167
  %0 = load i32, i32* @goodG2BStatic, align 4, !dbg !168
  %tobool = icmp ne i32 %0, 0, !dbg !168
  br i1 %tobool, label %if.then, label %if.end, !dbg !170

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !171, metadata !DIExpression()), !dbg !174
  %1 = load i8*, i8** %data.addr, align 8, !dbg !175
  %call = call i64 @strlen(i8* %1) #5, !dbg !176
  store i64 %call, i64* %dataLen, align 8, !dbg !174
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !177, metadata !DIExpression()), !dbg !178
  %2 = load i64, i64* %dataLen, align 8, !dbg !179
  %add = add i64 %2, 1, !dbg !179
  %mul = mul i64 %add, 1, !dbg !179
  %3 = alloca i8, i64 %mul, align 16, !dbg !179
  store i8* %3, i8** %dest, align 8, !dbg !178
  %4 = load i8*, i8** %dest, align 8, !dbg !180
  %5 = load i8*, i8** %data.addr, align 8, !dbg !181
  %call1 = call i8* @strcpy(i8* %4, i8* %5) #6, !dbg !182
  %6 = load i8*, i8** %dest, align 8, !dbg !183
  call void @printLine(i8* %6), !dbg !184
  br label %if.end, !dbg !185

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !186
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!22, !23, !24, !25, !26}
!llvm.ident = !{!27}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !17, line: 28, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !8, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !12, line: 74, baseType: !13)
!12 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{!0, !15, !18, !20}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "goodB2G1Static", scope: !2, file: !17, line: 59, type: !13, isLocal: true, isDefinition: true)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_21.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "goodB2G2Static", scope: !2, file: !17, line: 60, type: !13, isLocal: true, isDefinition: true)
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(name: "goodG2BStatic", scope: !2, file: !17, line: 61, type: !13, isLocal: true, isDefinition: true)
!22 = !{i32 7, !"Dwarf Version", i32 4}
!23 = !{i32 2, !"Debug Info Version", i32 3}
!24 = !{i32 1, !"wchar_size", i32 4}
!25 = !{i32 7, !"uwtable", i32 1}
!26 = !{i32 7, !"frame-pointer", i32 2}
!27 = !{!"clang version 13.0.0"}
!28 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_21_bad", scope: !17, file: !17, line: 44, type: !29, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!29 = !DISubroutineType(types: !30)
!30 = !{null}
!31 = !DILocalVariable(name: "data", scope: !28, file: !17, line: 46, type: !6)
!32 = !DILocation(line: 46, column: 12, scope: !28)
!33 = !DILocation(line: 47, column: 10, scope: !28)
!34 = !DILocation(line: 49, column: 10, scope: !28)
!35 = !DILocation(line: 50, column: 15, scope: !28)
!36 = !DILocation(line: 51, column: 13, scope: !28)
!37 = !DILocation(line: 51, column: 5, scope: !28)
!38 = !DILocation(line: 52, column: 1, scope: !28)
!39 = distinct !DISubprogram(name: "badSink", scope: !17, file: !17, line: 30, type: !40, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!40 = !DISubroutineType(types: !41)
!41 = !{null, !6}
!42 = !DILocalVariable(name: "data", arg: 1, scope: !39, file: !17, line: 30, type: !6)
!43 = !DILocation(line: 30, column: 28, scope: !39)
!44 = !DILocation(line: 32, column: 8, scope: !45)
!45 = distinct !DILexicalBlock(scope: !39, file: !17, line: 32, column: 8)
!46 = !DILocation(line: 32, column: 8, scope: !39)
!47 = !DILocalVariable(name: "dataLen", scope: !48, file: !17, line: 36, type: !50)
!48 = distinct !DILexicalBlock(scope: !49, file: !17, line: 34, column: 9)
!49 = distinct !DILexicalBlock(scope: !45, file: !17, line: 33, column: 5)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !12, line: 46, baseType: !51)
!51 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 36, column: 20, scope: !48)
!53 = !DILocation(line: 36, column: 45, scope: !48)
!54 = !DILocation(line: 36, column: 30, scope: !48)
!55 = !DILocalVariable(name: "dest", scope: !48, file: !17, line: 37, type: !6)
!56 = !DILocation(line: 37, column: 20, scope: !48)
!57 = !DILocation(line: 37, column: 35, scope: !48)
!58 = !DILocation(line: 38, column: 26, scope: !48)
!59 = !DILocation(line: 38, column: 32, scope: !48)
!60 = !DILocation(line: 38, column: 19, scope: !48)
!61 = !DILocation(line: 39, column: 31, scope: !48)
!62 = !DILocation(line: 39, column: 13, scope: !48)
!63 = !DILocation(line: 41, column: 5, scope: !49)
!64 = !DILocation(line: 42, column: 1, scope: !39)
!65 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_21_good", scope: !17, file: !17, line: 143, type: !29, scopeLine: 144, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!66 = !DILocation(line: 145, column: 5, scope: !65)
!67 = !DILocation(line: 146, column: 5, scope: !65)
!68 = !DILocation(line: 147, column: 5, scope: !65)
!69 = !DILocation(line: 148, column: 1, scope: !65)
!70 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 159, type: !71, scopeLine: 160, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!71 = !DISubroutineType(types: !72)
!72 = !{!13, !13, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !17, line: 159, type: !13)
!75 = !DILocation(line: 159, column: 14, scope: !70)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !17, line: 159, type: !73)
!77 = !DILocation(line: 159, column: 27, scope: !70)
!78 = !DILocation(line: 162, column: 22, scope: !70)
!79 = !DILocation(line: 162, column: 12, scope: !70)
!80 = !DILocation(line: 162, column: 5, scope: !70)
!81 = !DILocation(line: 164, column: 5, scope: !70)
!82 = !DILocation(line: 165, column: 5, scope: !70)
!83 = !DILocation(line: 166, column: 5, scope: !70)
!84 = !DILocation(line: 169, column: 5, scope: !70)
!85 = !DILocation(line: 170, column: 5, scope: !70)
!86 = !DILocation(line: 171, column: 5, scope: !70)
!87 = !DILocation(line: 173, column: 5, scope: !70)
!88 = distinct !DISubprogram(name: "goodB2G1", scope: !17, file: !17, line: 83, type: !29, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!89 = !DILocalVariable(name: "data", scope: !88, file: !17, line: 85, type: !6)
!90 = !DILocation(line: 85, column: 12, scope: !88)
!91 = !DILocation(line: 86, column: 10, scope: !88)
!92 = !DILocation(line: 88, column: 10, scope: !88)
!93 = !DILocation(line: 89, column: 20, scope: !88)
!94 = !DILocation(line: 90, column: 18, scope: !88)
!95 = !DILocation(line: 90, column: 5, scope: !88)
!96 = !DILocation(line: 91, column: 1, scope: !88)
!97 = distinct !DISubprogram(name: "goodB2G1Sink", scope: !17, file: !17, line: 64, type: !40, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!98 = !DILocalVariable(name: "data", arg: 1, scope: !97, file: !17, line: 64, type: !6)
!99 = !DILocation(line: 64, column: 33, scope: !97)
!100 = !DILocation(line: 66, column: 8, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !17, line: 66, column: 8)
!102 = !DILocation(line: 66, column: 8, scope: !97)
!103 = !DILocation(line: 69, column: 9, scope: !104)
!104 = distinct !DILexicalBlock(scope: !101, file: !17, line: 67, column: 5)
!105 = !DILocation(line: 70, column: 5, scope: !104)
!106 = !DILocalVariable(name: "dataLen", scope: !107, file: !17, line: 75, type: !50)
!107 = distinct !DILexicalBlock(scope: !108, file: !17, line: 73, column: 9)
!108 = distinct !DILexicalBlock(scope: !101, file: !17, line: 72, column: 5)
!109 = !DILocation(line: 75, column: 20, scope: !107)
!110 = !DILocation(line: 75, column: 48, scope: !107)
!111 = !DILocation(line: 75, column: 37, scope: !107)
!112 = !DILocation(line: 75, column: 30, scope: !107)
!113 = !DILocalVariable(name: "dest", scope: !107, file: !17, line: 76, type: !6)
!114 = !DILocation(line: 76, column: 20, scope: !107)
!115 = !DILocation(line: 76, column: 35, scope: !107)
!116 = !DILocation(line: 77, column: 26, scope: !107)
!117 = !DILocation(line: 77, column: 32, scope: !107)
!118 = !DILocation(line: 77, column: 19, scope: !107)
!119 = !DILocation(line: 78, column: 35, scope: !107)
!120 = !DILocation(line: 78, column: 24, scope: !107)
!121 = !DILocation(line: 78, column: 13, scope: !107)
!122 = !DILocation(line: 81, column: 1, scope: !97)
!123 = distinct !DISubprogram(name: "goodB2G2", scope: !17, file: !17, line: 108, type: !29, scopeLine: 109, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!124 = !DILocalVariable(name: "data", scope: !123, file: !17, line: 110, type: !6)
!125 = !DILocation(line: 110, column: 12, scope: !123)
!126 = !DILocation(line: 111, column: 10, scope: !123)
!127 = !DILocation(line: 113, column: 10, scope: !123)
!128 = !DILocation(line: 114, column: 20, scope: !123)
!129 = !DILocation(line: 115, column: 18, scope: !123)
!130 = !DILocation(line: 115, column: 5, scope: !123)
!131 = !DILocation(line: 116, column: 1, scope: !123)
!132 = distinct !DISubprogram(name: "goodB2G2Sink", scope: !17, file: !17, line: 94, type: !40, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!133 = !DILocalVariable(name: "data", arg: 1, scope: !132, file: !17, line: 94, type: !6)
!134 = !DILocation(line: 94, column: 33, scope: !132)
!135 = !DILocation(line: 96, column: 8, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !17, line: 96, column: 8)
!137 = !DILocation(line: 96, column: 8, scope: !132)
!138 = !DILocalVariable(name: "dataLen", scope: !139, file: !17, line: 100, type: !50)
!139 = distinct !DILexicalBlock(scope: !140, file: !17, line: 98, column: 9)
!140 = distinct !DILexicalBlock(scope: !136, file: !17, line: 97, column: 5)
!141 = !DILocation(line: 100, column: 20, scope: !139)
!142 = !DILocation(line: 100, column: 48, scope: !139)
!143 = !DILocation(line: 100, column: 37, scope: !139)
!144 = !DILocation(line: 100, column: 30, scope: !139)
!145 = !DILocalVariable(name: "dest", scope: !139, file: !17, line: 101, type: !6)
!146 = !DILocation(line: 101, column: 20, scope: !139)
!147 = !DILocation(line: 101, column: 35, scope: !139)
!148 = !DILocation(line: 102, column: 26, scope: !139)
!149 = !DILocation(line: 102, column: 32, scope: !139)
!150 = !DILocation(line: 102, column: 19, scope: !139)
!151 = !DILocation(line: 103, column: 35, scope: !139)
!152 = !DILocation(line: 103, column: 24, scope: !139)
!153 = !DILocation(line: 103, column: 13, scope: !139)
!154 = !DILocation(line: 105, column: 5, scope: !140)
!155 = !DILocation(line: 106, column: 1, scope: !132)
!156 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 133, type: !29, scopeLine: 134, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!157 = !DILocalVariable(name: "data", scope: !156, file: !17, line: 135, type: !6)
!158 = !DILocation(line: 135, column: 12, scope: !156)
!159 = !DILocation(line: 136, column: 10, scope: !156)
!160 = !DILocation(line: 138, column: 10, scope: !156)
!161 = !DILocation(line: 139, column: 19, scope: !156)
!162 = !DILocation(line: 140, column: 17, scope: !156)
!163 = !DILocation(line: 140, column: 5, scope: !156)
!164 = !DILocation(line: 141, column: 1, scope: !156)
!165 = distinct !DISubprogram(name: "goodG2BSink", scope: !17, file: !17, line: 119, type: !40, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!166 = !DILocalVariable(name: "data", arg: 1, scope: !165, file: !17, line: 119, type: !6)
!167 = !DILocation(line: 119, column: 32, scope: !165)
!168 = !DILocation(line: 121, column: 8, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !17, line: 121, column: 8)
!170 = !DILocation(line: 121, column: 8, scope: !165)
!171 = !DILocalVariable(name: "dataLen", scope: !172, file: !17, line: 125, type: !50)
!172 = distinct !DILexicalBlock(scope: !173, file: !17, line: 123, column: 9)
!173 = distinct !DILexicalBlock(scope: !169, file: !17, line: 122, column: 5)
!174 = !DILocation(line: 125, column: 20, scope: !172)
!175 = !DILocation(line: 125, column: 45, scope: !172)
!176 = !DILocation(line: 125, column: 30, scope: !172)
!177 = !DILocalVariable(name: "dest", scope: !172, file: !17, line: 126, type: !6)
!178 = !DILocation(line: 126, column: 20, scope: !172)
!179 = !DILocation(line: 126, column: 35, scope: !172)
!180 = !DILocation(line: 127, column: 26, scope: !172)
!181 = !DILocation(line: 127, column: 32, scope: !172)
!182 = !DILocation(line: 127, column: 19, scope: !172)
!183 = !DILocation(line: 128, column: 31, scope: !172)
!184 = !DILocation(line: 128, column: 13, scope: !172)
!185 = !DILocation(line: 130, column: 5, scope: !173)
!186 = !DILocation(line: 131, column: 1, scope: !165)
