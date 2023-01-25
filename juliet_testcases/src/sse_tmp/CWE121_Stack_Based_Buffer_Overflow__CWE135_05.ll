; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [43 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !15
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [43 x i8] c"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_05_bad() #0 !dbg !24 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !27, metadata !DIExpression()), !dbg !28
  store i8* null, i8** %data, align 8, !dbg !29
  %0 = load i32, i32* @staticTrue, align 4, !dbg !30
  %tobool = icmp ne i32 %0, 0, !dbg !30
  br i1 %tobool, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !33
  br label %if.end, !dbg !35

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !36
  %tobool1 = icmp ne i32 %1, 0, !dbg !36
  br i1 %tobool1, label %if.then2, label %if.end4, !dbg !38

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !39, metadata !DIExpression()), !dbg !44
  %2 = load i8*, i8** %data, align 8, !dbg !45
  %call = call i64 @strlen(i8* %2) #5, !dbg !46
  store i64 %call, i64* %dataLen, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !47, metadata !DIExpression()), !dbg !48
  %3 = load i64, i64* %dataLen, align 8, !dbg !49
  %add = add i64 %3, 1, !dbg !49
  %mul = mul i64 %add, 4, !dbg !49
  %4 = alloca i8, i64 %mul, align 16, !dbg !49
  store i8* %4, i8** %dest, align 8, !dbg !48
  %5 = load i8*, i8** %dest, align 8, !dbg !50
  %6 = bitcast i8* %5 to i32*, !dbg !50
  %7 = load i8*, i8** %data, align 8, !dbg !51
  %8 = bitcast i8* %7 to i32*, !dbg !51
  %call3 = call i32* @wcscpy(i32* %6, i32* %8) #6, !dbg !52
  %9 = load i8*, i8** %dest, align 8, !dbg !53
  call void @printLine(i8* %9), !dbg !54
  br label %if.end4, !dbg !55

if.end4:                                          ; preds = %if.then2, %if.end
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_05_good() #0 !dbg !57 {
entry:
  call void @goodB2G1(), !dbg !58
  call void @goodB2G2(), !dbg !59
  call void @goodG2B1(), !dbg !60
  call void @goodG2B2(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #6, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #6, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_05_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_05_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !81 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !82, metadata !DIExpression()), !dbg !83
  store i8* null, i8** %data, align 8, !dbg !84
  %0 = load i32, i32* @staticTrue, align 4, !dbg !85
  %tobool = icmp ne i32 %0, 0, !dbg !85
  br i1 %tobool, label %if.then, label %if.end, !dbg !87

if.then:                                          ; preds = %entry
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !88
  br label %if.end, !dbg !90

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFalse, align 4, !dbg !91
  %tobool1 = icmp ne i32 %1, 0, !dbg !91
  br i1 %tobool1, label %if.then2, label %if.else, !dbg !93

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !94
  br label %if.end4, !dbg !96

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !97, metadata !DIExpression()), !dbg !100
  %2 = load i8*, i8** %data, align 8, !dbg !101
  %3 = bitcast i8* %2 to i32*, !dbg !102
  %call = call i64 @wcslen(i32* %3) #5, !dbg !103
  store i64 %call, i64* %dataLen, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !104, metadata !DIExpression()), !dbg !105
  %4 = load i64, i64* %dataLen, align 8, !dbg !106
  %add = add i64 %4, 1, !dbg !106
  %mul = mul i64 %add, 4, !dbg !106
  %5 = alloca i8, i64 %mul, align 16, !dbg !106
  store i8* %5, i8** %dest, align 8, !dbg !105
  %6 = load i8*, i8** %dest, align 8, !dbg !107
  %7 = bitcast i8* %6 to i32*, !dbg !107
  %8 = load i8*, i8** %data, align 8, !dbg !108
  %9 = bitcast i8* %8 to i32*, !dbg !108
  %call3 = call i32* @wcscpy(i32* %7, i32* %9) #6, !dbg !109
  %10 = load i8*, i8** %dest, align 8, !dbg !110
  %11 = bitcast i8* %10 to i32*, !dbg !111
  call void @printWLine(i32* %11), !dbg !112
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then2
  ret void, !dbg !113
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !114 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !115, metadata !DIExpression()), !dbg !116
  store i8* null, i8** %data, align 8, !dbg !117
  %0 = load i32, i32* @staticTrue, align 4, !dbg !118
  %tobool = icmp ne i32 %0, 0, !dbg !118
  br i1 %tobool, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %entry
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !121
  br label %if.end, !dbg !123

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !124
  %tobool1 = icmp ne i32 %1, 0, !dbg !124
  br i1 %tobool1, label %if.then2, label %if.end4, !dbg !126

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !127, metadata !DIExpression()), !dbg !130
  %2 = load i8*, i8** %data, align 8, !dbg !131
  %3 = bitcast i8* %2 to i32*, !dbg !132
  %call = call i64 @wcslen(i32* %3) #5, !dbg !133
  store i64 %call, i64* %dataLen, align 8, !dbg !130
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !134, metadata !DIExpression()), !dbg !135
  %4 = load i64, i64* %dataLen, align 8, !dbg !136
  %add = add i64 %4, 1, !dbg !136
  %mul = mul i64 %add, 4, !dbg !136
  %5 = alloca i8, i64 %mul, align 16, !dbg !136
  store i8* %5, i8** %dest, align 8, !dbg !135
  %6 = load i8*, i8** %dest, align 8, !dbg !137
  %7 = bitcast i8* %6 to i32*, !dbg !137
  %8 = load i8*, i8** %data, align 8, !dbg !138
  %9 = bitcast i8* %8 to i32*, !dbg !138
  %call3 = call i32* @wcscpy(i32* %7, i32* %9) #6, !dbg !139
  %10 = load i8*, i8** %dest, align 8, !dbg !140
  %11 = bitcast i8* %10 to i32*, !dbg !141
  call void @printWLine(i32* %11), !dbg !142
  br label %if.end4, !dbg !143

if.end4:                                          ; preds = %if.then2, %if.end
  ret void, !dbg !144
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !145 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !146, metadata !DIExpression()), !dbg !147
  store i8* null, i8** %data, align 8, !dbg !148
  %0 = load i32, i32* @staticFalse, align 4, !dbg !149
  %tobool = icmp ne i32 %0, 0, !dbg !149
  br i1 %tobool, label %if.then, label %if.else, !dbg !151

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !152
  br label %if.end, !dbg !154

if.else:                                          ; preds = %entry
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.6, i64 0, i64 0), i8** %data, align 8, !dbg !155
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticTrue, align 4, !dbg !157
  %tobool1 = icmp ne i32 %1, 0, !dbg !157
  br i1 %tobool1, label %if.then2, label %if.end4, !dbg !159

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !160, metadata !DIExpression()), !dbg !163
  %2 = load i8*, i8** %data, align 8, !dbg !164
  %call = call i64 @strlen(i8* %2) #5, !dbg !165
  store i64 %call, i64* %dataLen, align 8, !dbg !163
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !166, metadata !DIExpression()), !dbg !167
  %3 = load i64, i64* %dataLen, align 8, !dbg !168
  %add = add i64 %3, 1, !dbg !168
  %mul = mul i64 %add, 1, !dbg !168
  %4 = alloca i8, i64 %mul, align 16, !dbg !168
  store i8* %4, i8** %dest, align 8, !dbg !167
  %5 = load i8*, i8** %dest, align 8, !dbg !169
  %6 = load i8*, i8** %data, align 8, !dbg !170
  %call3 = call i8* @strcpy(i8* %5, i8* %6) #6, !dbg !171
  %7 = load i8*, i8** %dest, align 8, !dbg !172
  call void @printLine(i8* %7), !dbg !173
  br label %if.end4, !dbg !174

if.end4:                                          ; preds = %if.then2, %if.end
  ret void, !dbg !175
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !176 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !177, metadata !DIExpression()), !dbg !178
  store i8* null, i8** %data, align 8, !dbg !179
  %0 = load i32, i32* @staticTrue, align 4, !dbg !180
  %tobool = icmp ne i32 %0, 0, !dbg !180
  br i1 %tobool, label %if.then, label %if.end, !dbg !182

if.then:                                          ; preds = %entry
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.6, i64 0, i64 0), i8** %data, align 8, !dbg !183
  br label %if.end, !dbg !185

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !186
  %tobool1 = icmp ne i32 %1, 0, !dbg !186
  br i1 %tobool1, label %if.then2, label %if.end4, !dbg !188

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !189, metadata !DIExpression()), !dbg !192
  %2 = load i8*, i8** %data, align 8, !dbg !193
  %call = call i64 @strlen(i8* %2) #5, !dbg !194
  store i64 %call, i64* %dataLen, align 8, !dbg !192
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !195, metadata !DIExpression()), !dbg !196
  %3 = load i64, i64* %dataLen, align 8, !dbg !197
  %add = add i64 %3, 1, !dbg !197
  %mul = mul i64 %add, 1, !dbg !197
  %4 = alloca i8, i64 %mul, align 16, !dbg !197
  store i8* %4, i8** %dest, align 8, !dbg !196
  %5 = load i8*, i8** %dest, align 8, !dbg !198
  %6 = load i8*, i8** %data, align 8, !dbg !199
  %call3 = call i8* @strcpy(i8* %5, i8* %6) #6, !dbg !200
  %7 = load i8*, i8** %dest, align 8, !dbg !201
  call void @printLine(i8* %7), !dbg !202
  br label %if.end4, !dbg !203

if.end4:                                          ; preds = %if.then2, %if.end
  ret void, !dbg !204
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !17, line: 28, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !9, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !12, line: 74, baseType: !13)
!12 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{!0, !15}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !17, line: 29, type: !13, isLocal: true, isDefinition: true)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_05.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"clang version 13.0.0"}
!24 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_05_bad", scope: !17, file: !17, line: 33, type: !25, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !DILocalVariable(name: "data", scope: !24, file: !17, line: 35, type: !6)
!28 = !DILocation(line: 35, column: 12, scope: !24)
!29 = !DILocation(line: 36, column: 10, scope: !24)
!30 = !DILocation(line: 37, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !24, file: !17, line: 37, column: 8)
!32 = !DILocation(line: 37, column: 8, scope: !24)
!33 = !DILocation(line: 40, column: 14, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !17, line: 38, column: 5)
!35 = !DILocation(line: 41, column: 5, scope: !34)
!36 = !DILocation(line: 42, column: 8, scope: !37)
!37 = distinct !DILexicalBlock(scope: !24, file: !17, line: 42, column: 8)
!38 = !DILocation(line: 42, column: 8, scope: !24)
!39 = !DILocalVariable(name: "dataLen", scope: !40, file: !17, line: 46, type: !42)
!40 = distinct !DILexicalBlock(scope: !41, file: !17, line: 44, column: 9)
!41 = distinct !DILexicalBlock(scope: !37, file: !17, line: 43, column: 5)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !12, line: 46, baseType: !43)
!43 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 46, column: 20, scope: !40)
!45 = !DILocation(line: 46, column: 45, scope: !40)
!46 = !DILocation(line: 46, column: 30, scope: !40)
!47 = !DILocalVariable(name: "dest", scope: !40, file: !17, line: 47, type: !6)
!48 = !DILocation(line: 47, column: 20, scope: !40)
!49 = !DILocation(line: 47, column: 35, scope: !40)
!50 = !DILocation(line: 48, column: 26, scope: !40)
!51 = !DILocation(line: 48, column: 32, scope: !40)
!52 = !DILocation(line: 48, column: 19, scope: !40)
!53 = !DILocation(line: 49, column: 31, scope: !40)
!54 = !DILocation(line: 49, column: 13, scope: !40)
!55 = !DILocation(line: 51, column: 5, scope: !41)
!56 = !DILocation(line: 52, column: 1, scope: !24)
!57 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_05_good", scope: !17, file: !17, line: 156, type: !25, scopeLine: 157, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!58 = !DILocation(line: 158, column: 5, scope: !57)
!59 = !DILocation(line: 159, column: 5, scope: !57)
!60 = !DILocation(line: 160, column: 5, scope: !57)
!61 = !DILocation(line: 161, column: 5, scope: !57)
!62 = !DILocation(line: 162, column: 1, scope: !57)
!63 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 173, type: !64, scopeLine: 174, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!64 = !DISubroutineType(types: !65)
!65 = !{!13, !13, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !17, line: 173, type: !13)
!68 = !DILocation(line: 173, column: 14, scope: !63)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !17, line: 173, type: !66)
!70 = !DILocation(line: 173, column: 27, scope: !63)
!71 = !DILocation(line: 176, column: 22, scope: !63)
!72 = !DILocation(line: 176, column: 12, scope: !63)
!73 = !DILocation(line: 176, column: 5, scope: !63)
!74 = !DILocation(line: 178, column: 5, scope: !63)
!75 = !DILocation(line: 179, column: 5, scope: !63)
!76 = !DILocation(line: 180, column: 5, scope: !63)
!77 = !DILocation(line: 183, column: 5, scope: !63)
!78 = !DILocation(line: 184, column: 5, scope: !63)
!79 = !DILocation(line: 185, column: 5, scope: !63)
!80 = !DILocation(line: 187, column: 5, scope: !63)
!81 = distinct !DISubprogram(name: "goodB2G1", scope: !17, file: !17, line: 59, type: !25, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DILocalVariable(name: "data", scope: !81, file: !17, line: 61, type: !6)
!83 = !DILocation(line: 61, column: 12, scope: !81)
!84 = !DILocation(line: 62, column: 10, scope: !81)
!85 = !DILocation(line: 63, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !81, file: !17, line: 63, column: 8)
!87 = !DILocation(line: 63, column: 8, scope: !81)
!88 = !DILocation(line: 66, column: 14, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !17, line: 64, column: 5)
!90 = !DILocation(line: 67, column: 5, scope: !89)
!91 = !DILocation(line: 68, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !81, file: !17, line: 68, column: 8)
!93 = !DILocation(line: 68, column: 8, scope: !81)
!94 = !DILocation(line: 71, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !17, line: 69, column: 5)
!96 = !DILocation(line: 72, column: 5, scope: !95)
!97 = !DILocalVariable(name: "dataLen", scope: !98, file: !17, line: 77, type: !42)
!98 = distinct !DILexicalBlock(scope: !99, file: !17, line: 75, column: 9)
!99 = distinct !DILexicalBlock(scope: !92, file: !17, line: 74, column: 5)
!100 = !DILocation(line: 77, column: 20, scope: !98)
!101 = !DILocation(line: 77, column: 48, scope: !98)
!102 = !DILocation(line: 77, column: 37, scope: !98)
!103 = !DILocation(line: 77, column: 30, scope: !98)
!104 = !DILocalVariable(name: "dest", scope: !98, file: !17, line: 78, type: !6)
!105 = !DILocation(line: 78, column: 20, scope: !98)
!106 = !DILocation(line: 78, column: 35, scope: !98)
!107 = !DILocation(line: 79, column: 26, scope: !98)
!108 = !DILocation(line: 79, column: 32, scope: !98)
!109 = !DILocation(line: 79, column: 19, scope: !98)
!110 = !DILocation(line: 80, column: 35, scope: !98)
!111 = !DILocation(line: 80, column: 24, scope: !98)
!112 = !DILocation(line: 80, column: 13, scope: !98)
!113 = !DILocation(line: 83, column: 1, scope: !81)
!114 = distinct !DISubprogram(name: "goodB2G2", scope: !17, file: !17, line: 86, type: !25, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!115 = !DILocalVariable(name: "data", scope: !114, file: !17, line: 88, type: !6)
!116 = !DILocation(line: 88, column: 12, scope: !114)
!117 = !DILocation(line: 89, column: 10, scope: !114)
!118 = !DILocation(line: 90, column: 8, scope: !119)
!119 = distinct !DILexicalBlock(scope: !114, file: !17, line: 90, column: 8)
!120 = !DILocation(line: 90, column: 8, scope: !114)
!121 = !DILocation(line: 93, column: 14, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !17, line: 91, column: 5)
!123 = !DILocation(line: 94, column: 5, scope: !122)
!124 = !DILocation(line: 95, column: 8, scope: !125)
!125 = distinct !DILexicalBlock(scope: !114, file: !17, line: 95, column: 8)
!126 = !DILocation(line: 95, column: 8, scope: !114)
!127 = !DILocalVariable(name: "dataLen", scope: !128, file: !17, line: 99, type: !42)
!128 = distinct !DILexicalBlock(scope: !129, file: !17, line: 97, column: 9)
!129 = distinct !DILexicalBlock(scope: !125, file: !17, line: 96, column: 5)
!130 = !DILocation(line: 99, column: 20, scope: !128)
!131 = !DILocation(line: 99, column: 48, scope: !128)
!132 = !DILocation(line: 99, column: 37, scope: !128)
!133 = !DILocation(line: 99, column: 30, scope: !128)
!134 = !DILocalVariable(name: "dest", scope: !128, file: !17, line: 100, type: !6)
!135 = !DILocation(line: 100, column: 20, scope: !128)
!136 = !DILocation(line: 100, column: 35, scope: !128)
!137 = !DILocation(line: 101, column: 26, scope: !128)
!138 = !DILocation(line: 101, column: 32, scope: !128)
!139 = !DILocation(line: 101, column: 19, scope: !128)
!140 = !DILocation(line: 102, column: 35, scope: !128)
!141 = !DILocation(line: 102, column: 24, scope: !128)
!142 = !DILocation(line: 102, column: 13, scope: !128)
!143 = !DILocation(line: 104, column: 5, scope: !129)
!144 = !DILocation(line: 105, column: 1, scope: !114)
!145 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 108, type: !25, scopeLine: 109, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!146 = !DILocalVariable(name: "data", scope: !145, file: !17, line: 110, type: !6)
!147 = !DILocation(line: 110, column: 12, scope: !145)
!148 = !DILocation(line: 111, column: 10, scope: !145)
!149 = !DILocation(line: 112, column: 8, scope: !150)
!150 = distinct !DILexicalBlock(scope: !145, file: !17, line: 112, column: 8)
!151 = !DILocation(line: 112, column: 8, scope: !145)
!152 = !DILocation(line: 115, column: 9, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !17, line: 113, column: 5)
!154 = !DILocation(line: 116, column: 5, scope: !153)
!155 = !DILocation(line: 120, column: 14, scope: !156)
!156 = distinct !DILexicalBlock(scope: !150, file: !17, line: 118, column: 5)
!157 = !DILocation(line: 122, column: 8, scope: !158)
!158 = distinct !DILexicalBlock(scope: !145, file: !17, line: 122, column: 8)
!159 = !DILocation(line: 122, column: 8, scope: !145)
!160 = !DILocalVariable(name: "dataLen", scope: !161, file: !17, line: 126, type: !42)
!161 = distinct !DILexicalBlock(scope: !162, file: !17, line: 124, column: 9)
!162 = distinct !DILexicalBlock(scope: !158, file: !17, line: 123, column: 5)
!163 = !DILocation(line: 126, column: 20, scope: !161)
!164 = !DILocation(line: 126, column: 45, scope: !161)
!165 = !DILocation(line: 126, column: 30, scope: !161)
!166 = !DILocalVariable(name: "dest", scope: !161, file: !17, line: 127, type: !6)
!167 = !DILocation(line: 127, column: 20, scope: !161)
!168 = !DILocation(line: 127, column: 35, scope: !161)
!169 = !DILocation(line: 128, column: 26, scope: !161)
!170 = !DILocation(line: 128, column: 32, scope: !161)
!171 = !DILocation(line: 128, column: 19, scope: !161)
!172 = !DILocation(line: 129, column: 31, scope: !161)
!173 = !DILocation(line: 129, column: 13, scope: !161)
!174 = !DILocation(line: 131, column: 5, scope: !162)
!175 = !DILocation(line: 132, column: 1, scope: !145)
!176 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 135, type: !25, scopeLine: 136, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!177 = !DILocalVariable(name: "data", scope: !176, file: !17, line: 137, type: !6)
!178 = !DILocation(line: 137, column: 12, scope: !176)
!179 = !DILocation(line: 138, column: 10, scope: !176)
!180 = !DILocation(line: 139, column: 8, scope: !181)
!181 = distinct !DILexicalBlock(scope: !176, file: !17, line: 139, column: 8)
!182 = !DILocation(line: 139, column: 8, scope: !176)
!183 = !DILocation(line: 142, column: 14, scope: !184)
!184 = distinct !DILexicalBlock(scope: !181, file: !17, line: 140, column: 5)
!185 = !DILocation(line: 143, column: 5, scope: !184)
!186 = !DILocation(line: 144, column: 8, scope: !187)
!187 = distinct !DILexicalBlock(scope: !176, file: !17, line: 144, column: 8)
!188 = !DILocation(line: 144, column: 8, scope: !176)
!189 = !DILocalVariable(name: "dataLen", scope: !190, file: !17, line: 148, type: !42)
!190 = distinct !DILexicalBlock(scope: !191, file: !17, line: 146, column: 9)
!191 = distinct !DILexicalBlock(scope: !187, file: !17, line: 145, column: 5)
!192 = !DILocation(line: 148, column: 20, scope: !190)
!193 = !DILocation(line: 148, column: 45, scope: !190)
!194 = !DILocation(line: 148, column: 30, scope: !190)
!195 = !DILocalVariable(name: "dest", scope: !190, file: !17, line: 149, type: !6)
!196 = !DILocation(line: 149, column: 20, scope: !190)
!197 = !DILocation(line: 149, column: 35, scope: !190)
!198 = !DILocation(line: 150, column: 26, scope: !190)
!199 = !DILocation(line: 150, column: 32, scope: !190)
!200 = !DILocation(line: 150, column: 19, scope: !190)
!201 = !DILocation(line: 151, column: 31, scope: !190)
!202 = !DILocation(line: 151, column: 13, scope: !190)
!203 = !DILocation(line: 153, column: 5, scope: !191)
!204 = !DILocation(line: 154, column: 1, scope: !176)
