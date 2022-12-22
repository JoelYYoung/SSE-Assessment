; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [43 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [43 x i8] c"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_07_bad() #0 !dbg !22 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i8* null, i8** %data, align 8, !dbg !27
  %0 = load i32, i32* @staticFive, align 4, !dbg !28
  %cmp = icmp eq i32 %0, 5, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !32
  br label %if.end, !dbg !34

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !35
  %cmp1 = icmp eq i32 %1, 5, !dbg !37
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !38

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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_07_good() #0 !dbg !57 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_07_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_07_bad(), !dbg !78
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
  %0 = load i32, i32* @staticFive, align 4, !dbg !85
  %cmp = icmp eq i32 %0, 5, !dbg !87
  br i1 %cmp, label %if.then, label %if.end, !dbg !88

if.then:                                          ; preds = %entry
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !89
  br label %if.end, !dbg !91

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !92
  %cmp1 = icmp ne i32 %1, 5, !dbg !94
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !95

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !96
  br label %if.end4, !dbg !98

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !99, metadata !DIExpression()), !dbg !102
  %2 = load i8*, i8** %data, align 8, !dbg !103
  %3 = bitcast i8* %2 to i32*, !dbg !104
  %call = call i64 @wcslen(i32* %3) #5, !dbg !105
  store i64 %call, i64* %dataLen, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !106, metadata !DIExpression()), !dbg !107
  %4 = load i64, i64* %dataLen, align 8, !dbg !108
  %add = add i64 %4, 1, !dbg !108
  %mul = mul i64 %add, 4, !dbg !108
  %5 = alloca i8, i64 %mul, align 16, !dbg !108
  store i8* %5, i8** %dest, align 8, !dbg !107
  %6 = load i8*, i8** %dest, align 8, !dbg !109
  %7 = bitcast i8* %6 to i32*, !dbg !109
  %8 = load i8*, i8** %data, align 8, !dbg !110
  %9 = bitcast i8* %8 to i32*, !dbg !110
  %call3 = call i32* @wcscpy(i32* %7, i32* %9) #6, !dbg !111
  %10 = load i8*, i8** %dest, align 8, !dbg !112
  %11 = bitcast i8* %10 to i32*, !dbg !113
  call void @printWLine(i32* %11), !dbg !114
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then2
  ret void, !dbg !115
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !116 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !117, metadata !DIExpression()), !dbg !118
  store i8* null, i8** %data, align 8, !dbg !119
  %0 = load i32, i32* @staticFive, align 4, !dbg !120
  %cmp = icmp eq i32 %0, 5, !dbg !122
  br i1 %cmp, label %if.then, label %if.end, !dbg !123

if.then:                                          ; preds = %entry
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !124
  br label %if.end, !dbg !126

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !127
  %cmp1 = icmp eq i32 %1, 5, !dbg !129
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !130

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !131, metadata !DIExpression()), !dbg !134
  %2 = load i8*, i8** %data, align 8, !dbg !135
  %3 = bitcast i8* %2 to i32*, !dbg !136
  %call = call i64 @wcslen(i32* %3) #5, !dbg !137
  store i64 %call, i64* %dataLen, align 8, !dbg !134
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !138, metadata !DIExpression()), !dbg !139
  %4 = load i64, i64* %dataLen, align 8, !dbg !140
  %add = add i64 %4, 1, !dbg !140
  %mul = mul i64 %add, 4, !dbg !140
  %5 = alloca i8, i64 %mul, align 16, !dbg !140
  store i8* %5, i8** %dest, align 8, !dbg !139
  %6 = load i8*, i8** %dest, align 8, !dbg !141
  %7 = bitcast i8* %6 to i32*, !dbg !141
  %8 = load i8*, i8** %data, align 8, !dbg !142
  %9 = bitcast i8* %8 to i32*, !dbg !142
  %call3 = call i32* @wcscpy(i32* %7, i32* %9) #6, !dbg !143
  %10 = load i8*, i8** %dest, align 8, !dbg !144
  %11 = bitcast i8* %10 to i32*, !dbg !145
  call void @printWLine(i32* %11), !dbg !146
  br label %if.end4, !dbg !147

if.end4:                                          ; preds = %if.then2, %if.end
  ret void, !dbg !148
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !149 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !150, metadata !DIExpression()), !dbg !151
  store i8* null, i8** %data, align 8, !dbg !152
  %0 = load i32, i32* @staticFive, align 4, !dbg !153
  %cmp = icmp ne i32 %0, 5, !dbg !155
  br i1 %cmp, label %if.then, label %if.else, !dbg !156

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !157
  br label %if.end, !dbg !159

if.else:                                          ; preds = %entry
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.6, i64 0, i64 0), i8** %data, align 8, !dbg !160
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticFive, align 4, !dbg !162
  %cmp1 = icmp eq i32 %1, 5, !dbg !164
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !165

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !166, metadata !DIExpression()), !dbg !169
  %2 = load i8*, i8** %data, align 8, !dbg !170
  %call = call i64 @strlen(i8* %2) #5, !dbg !171
  store i64 %call, i64* %dataLen, align 8, !dbg !169
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !172, metadata !DIExpression()), !dbg !173
  %3 = load i64, i64* %dataLen, align 8, !dbg !174
  %add = add i64 %3, 1, !dbg !174
  %mul = mul i64 %add, 1, !dbg !174
  %4 = alloca i8, i64 %mul, align 16, !dbg !174
  store i8* %4, i8** %dest, align 8, !dbg !173
  %5 = load i8*, i8** %dest, align 8, !dbg !175
  %6 = load i8*, i8** %data, align 8, !dbg !176
  %call3 = call i8* @strcpy(i8* %5, i8* %6) #6, !dbg !177
  %7 = load i8*, i8** %dest, align 8, !dbg !178
  call void @printLine(i8* %7), !dbg !179
  br label %if.end4, !dbg !180

if.end4:                                          ; preds = %if.then2, %if.end
  ret void, !dbg !181
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !182 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !183, metadata !DIExpression()), !dbg !184
  store i8* null, i8** %data, align 8, !dbg !185
  %0 = load i32, i32* @staticFive, align 4, !dbg !186
  %cmp = icmp eq i32 %0, 5, !dbg !188
  br i1 %cmp, label %if.then, label %if.end, !dbg !189

if.then:                                          ; preds = %entry
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.6, i64 0, i64 0), i8** %data, align 8, !dbg !190
  br label %if.end, !dbg !192

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !193
  %cmp1 = icmp eq i32 %1, 5, !dbg !195
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !196

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !197, metadata !DIExpression()), !dbg !200
  %2 = load i8*, i8** %data, align 8, !dbg !201
  %call = call i64 @strlen(i8* %2) #5, !dbg !202
  store i64 %call, i64* %dataLen, align 8, !dbg !200
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !203, metadata !DIExpression()), !dbg !204
  %3 = load i64, i64* %dataLen, align 8, !dbg !205
  %add = add i64 %3, 1, !dbg !205
  %mul = mul i64 %add, 1, !dbg !205
  %4 = alloca i8, i64 %mul, align 16, !dbg !205
  store i8* %4, i8** %dest, align 8, !dbg !204
  %5 = load i8*, i8** %dest, align 8, !dbg !206
  %6 = load i8*, i8** %data, align 8, !dbg !207
  %call3 = call i8* @strcpy(i8* %5, i8* %6) #6, !dbg !208
  %7 = load i8*, i8** %dest, align 8, !dbg !209
  call void @printLine(i8* %7), !dbg !210
  br label %if.end4, !dbg !211

if.end4:                                          ; preds = %if.then2, %if.end
  ret void, !dbg !212
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !15, line: 28, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !9, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !12, line: 74, baseType: !13)
!12 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{!0}
!15 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_07.c", directory: "/root/SSE-Assessment")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_07_bad", scope: !15, file: !15, line: 32, type: !23, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !15, line: 34, type: !6)
!26 = !DILocation(line: 34, column: 12, scope: !22)
!27 = !DILocation(line: 35, column: 10, scope: !22)
!28 = !DILocation(line: 36, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !22, file: !15, line: 36, column: 8)
!30 = !DILocation(line: 36, column: 18, scope: !29)
!31 = !DILocation(line: 36, column: 8, scope: !22)
!32 = !DILocation(line: 39, column: 14, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 37, column: 5)
!34 = !DILocation(line: 40, column: 5, scope: !33)
!35 = !DILocation(line: 41, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !22, file: !15, line: 41, column: 8)
!37 = !DILocation(line: 41, column: 18, scope: !36)
!38 = !DILocation(line: 41, column: 8, scope: !22)
!39 = !DILocalVariable(name: "dataLen", scope: !40, file: !15, line: 45, type: !42)
!40 = distinct !DILexicalBlock(scope: !41, file: !15, line: 43, column: 9)
!41 = distinct !DILexicalBlock(scope: !36, file: !15, line: 42, column: 5)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !12, line: 46, baseType: !43)
!43 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 45, column: 20, scope: !40)
!45 = !DILocation(line: 45, column: 45, scope: !40)
!46 = !DILocation(line: 45, column: 30, scope: !40)
!47 = !DILocalVariable(name: "dest", scope: !40, file: !15, line: 46, type: !6)
!48 = !DILocation(line: 46, column: 20, scope: !40)
!49 = !DILocation(line: 46, column: 35, scope: !40)
!50 = !DILocation(line: 47, column: 26, scope: !40)
!51 = !DILocation(line: 47, column: 32, scope: !40)
!52 = !DILocation(line: 47, column: 19, scope: !40)
!53 = !DILocation(line: 48, column: 31, scope: !40)
!54 = !DILocation(line: 48, column: 13, scope: !40)
!55 = !DILocation(line: 50, column: 5, scope: !41)
!56 = !DILocation(line: 51, column: 1, scope: !22)
!57 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_07_good", scope: !15, file: !15, line: 155, type: !23, scopeLine: 156, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!58 = !DILocation(line: 157, column: 5, scope: !57)
!59 = !DILocation(line: 158, column: 5, scope: !57)
!60 = !DILocation(line: 159, column: 5, scope: !57)
!61 = !DILocation(line: 160, column: 5, scope: !57)
!62 = !DILocation(line: 161, column: 1, scope: !57)
!63 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 172, type: !64, scopeLine: 173, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!64 = !DISubroutineType(types: !65)
!65 = !{!13, !13, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !15, line: 172, type: !13)
!68 = !DILocation(line: 172, column: 14, scope: !63)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !15, line: 172, type: !66)
!70 = !DILocation(line: 172, column: 27, scope: !63)
!71 = !DILocation(line: 175, column: 22, scope: !63)
!72 = !DILocation(line: 175, column: 12, scope: !63)
!73 = !DILocation(line: 175, column: 5, scope: !63)
!74 = !DILocation(line: 177, column: 5, scope: !63)
!75 = !DILocation(line: 178, column: 5, scope: !63)
!76 = !DILocation(line: 179, column: 5, scope: !63)
!77 = !DILocation(line: 182, column: 5, scope: !63)
!78 = !DILocation(line: 183, column: 5, scope: !63)
!79 = !DILocation(line: 184, column: 5, scope: !63)
!80 = !DILocation(line: 186, column: 5, scope: !63)
!81 = distinct !DISubprogram(name: "goodB2G1", scope: !15, file: !15, line: 58, type: !23, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DILocalVariable(name: "data", scope: !81, file: !15, line: 60, type: !6)
!83 = !DILocation(line: 60, column: 12, scope: !81)
!84 = !DILocation(line: 61, column: 10, scope: !81)
!85 = !DILocation(line: 62, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !81, file: !15, line: 62, column: 8)
!87 = !DILocation(line: 62, column: 18, scope: !86)
!88 = !DILocation(line: 62, column: 8, scope: !81)
!89 = !DILocation(line: 65, column: 14, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !15, line: 63, column: 5)
!91 = !DILocation(line: 66, column: 5, scope: !90)
!92 = !DILocation(line: 67, column: 8, scope: !93)
!93 = distinct !DILexicalBlock(scope: !81, file: !15, line: 67, column: 8)
!94 = !DILocation(line: 67, column: 18, scope: !93)
!95 = !DILocation(line: 67, column: 8, scope: !81)
!96 = !DILocation(line: 70, column: 9, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !15, line: 68, column: 5)
!98 = !DILocation(line: 71, column: 5, scope: !97)
!99 = !DILocalVariable(name: "dataLen", scope: !100, file: !15, line: 76, type: !42)
!100 = distinct !DILexicalBlock(scope: !101, file: !15, line: 74, column: 9)
!101 = distinct !DILexicalBlock(scope: !93, file: !15, line: 73, column: 5)
!102 = !DILocation(line: 76, column: 20, scope: !100)
!103 = !DILocation(line: 76, column: 48, scope: !100)
!104 = !DILocation(line: 76, column: 37, scope: !100)
!105 = !DILocation(line: 76, column: 30, scope: !100)
!106 = !DILocalVariable(name: "dest", scope: !100, file: !15, line: 77, type: !6)
!107 = !DILocation(line: 77, column: 20, scope: !100)
!108 = !DILocation(line: 77, column: 35, scope: !100)
!109 = !DILocation(line: 78, column: 26, scope: !100)
!110 = !DILocation(line: 78, column: 32, scope: !100)
!111 = !DILocation(line: 78, column: 19, scope: !100)
!112 = !DILocation(line: 79, column: 35, scope: !100)
!113 = !DILocation(line: 79, column: 24, scope: !100)
!114 = !DILocation(line: 79, column: 13, scope: !100)
!115 = !DILocation(line: 82, column: 1, scope: !81)
!116 = distinct !DISubprogram(name: "goodB2G2", scope: !15, file: !15, line: 85, type: !23, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!117 = !DILocalVariable(name: "data", scope: !116, file: !15, line: 87, type: !6)
!118 = !DILocation(line: 87, column: 12, scope: !116)
!119 = !DILocation(line: 88, column: 10, scope: !116)
!120 = !DILocation(line: 89, column: 8, scope: !121)
!121 = distinct !DILexicalBlock(scope: !116, file: !15, line: 89, column: 8)
!122 = !DILocation(line: 89, column: 18, scope: !121)
!123 = !DILocation(line: 89, column: 8, scope: !116)
!124 = !DILocation(line: 92, column: 14, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !15, line: 90, column: 5)
!126 = !DILocation(line: 93, column: 5, scope: !125)
!127 = !DILocation(line: 94, column: 8, scope: !128)
!128 = distinct !DILexicalBlock(scope: !116, file: !15, line: 94, column: 8)
!129 = !DILocation(line: 94, column: 18, scope: !128)
!130 = !DILocation(line: 94, column: 8, scope: !116)
!131 = !DILocalVariable(name: "dataLen", scope: !132, file: !15, line: 98, type: !42)
!132 = distinct !DILexicalBlock(scope: !133, file: !15, line: 96, column: 9)
!133 = distinct !DILexicalBlock(scope: !128, file: !15, line: 95, column: 5)
!134 = !DILocation(line: 98, column: 20, scope: !132)
!135 = !DILocation(line: 98, column: 48, scope: !132)
!136 = !DILocation(line: 98, column: 37, scope: !132)
!137 = !DILocation(line: 98, column: 30, scope: !132)
!138 = !DILocalVariable(name: "dest", scope: !132, file: !15, line: 99, type: !6)
!139 = !DILocation(line: 99, column: 20, scope: !132)
!140 = !DILocation(line: 99, column: 35, scope: !132)
!141 = !DILocation(line: 100, column: 26, scope: !132)
!142 = !DILocation(line: 100, column: 32, scope: !132)
!143 = !DILocation(line: 100, column: 19, scope: !132)
!144 = !DILocation(line: 101, column: 35, scope: !132)
!145 = !DILocation(line: 101, column: 24, scope: !132)
!146 = !DILocation(line: 101, column: 13, scope: !132)
!147 = !DILocation(line: 103, column: 5, scope: !133)
!148 = !DILocation(line: 104, column: 1, scope: !116)
!149 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 107, type: !23, scopeLine: 108, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!150 = !DILocalVariable(name: "data", scope: !149, file: !15, line: 109, type: !6)
!151 = !DILocation(line: 109, column: 12, scope: !149)
!152 = !DILocation(line: 110, column: 10, scope: !149)
!153 = !DILocation(line: 111, column: 8, scope: !154)
!154 = distinct !DILexicalBlock(scope: !149, file: !15, line: 111, column: 8)
!155 = !DILocation(line: 111, column: 18, scope: !154)
!156 = !DILocation(line: 111, column: 8, scope: !149)
!157 = !DILocation(line: 114, column: 9, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !15, line: 112, column: 5)
!159 = !DILocation(line: 115, column: 5, scope: !158)
!160 = !DILocation(line: 119, column: 14, scope: !161)
!161 = distinct !DILexicalBlock(scope: !154, file: !15, line: 117, column: 5)
!162 = !DILocation(line: 121, column: 8, scope: !163)
!163 = distinct !DILexicalBlock(scope: !149, file: !15, line: 121, column: 8)
!164 = !DILocation(line: 121, column: 18, scope: !163)
!165 = !DILocation(line: 121, column: 8, scope: !149)
!166 = !DILocalVariable(name: "dataLen", scope: !167, file: !15, line: 125, type: !42)
!167 = distinct !DILexicalBlock(scope: !168, file: !15, line: 123, column: 9)
!168 = distinct !DILexicalBlock(scope: !163, file: !15, line: 122, column: 5)
!169 = !DILocation(line: 125, column: 20, scope: !167)
!170 = !DILocation(line: 125, column: 45, scope: !167)
!171 = !DILocation(line: 125, column: 30, scope: !167)
!172 = !DILocalVariable(name: "dest", scope: !167, file: !15, line: 126, type: !6)
!173 = !DILocation(line: 126, column: 20, scope: !167)
!174 = !DILocation(line: 126, column: 35, scope: !167)
!175 = !DILocation(line: 127, column: 26, scope: !167)
!176 = !DILocation(line: 127, column: 32, scope: !167)
!177 = !DILocation(line: 127, column: 19, scope: !167)
!178 = !DILocation(line: 128, column: 31, scope: !167)
!179 = !DILocation(line: 128, column: 13, scope: !167)
!180 = !DILocation(line: 130, column: 5, scope: !168)
!181 = !DILocation(line: 131, column: 1, scope: !149)
!182 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 134, type: !23, scopeLine: 135, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!183 = !DILocalVariable(name: "data", scope: !182, file: !15, line: 136, type: !6)
!184 = !DILocation(line: 136, column: 12, scope: !182)
!185 = !DILocation(line: 137, column: 10, scope: !182)
!186 = !DILocation(line: 138, column: 8, scope: !187)
!187 = distinct !DILexicalBlock(scope: !182, file: !15, line: 138, column: 8)
!188 = !DILocation(line: 138, column: 18, scope: !187)
!189 = !DILocation(line: 138, column: 8, scope: !182)
!190 = !DILocation(line: 141, column: 14, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !15, line: 139, column: 5)
!192 = !DILocation(line: 142, column: 5, scope: !191)
!193 = !DILocation(line: 143, column: 8, scope: !194)
!194 = distinct !DILexicalBlock(scope: !182, file: !15, line: 143, column: 8)
!195 = !DILocation(line: 143, column: 18, scope: !194)
!196 = !DILocation(line: 143, column: 8, scope: !182)
!197 = !DILocalVariable(name: "dataLen", scope: !198, file: !15, line: 147, type: !42)
!198 = distinct !DILexicalBlock(scope: !199, file: !15, line: 145, column: 9)
!199 = distinct !DILexicalBlock(scope: !194, file: !15, line: 144, column: 5)
!200 = !DILocation(line: 147, column: 20, scope: !198)
!201 = !DILocation(line: 147, column: 45, scope: !198)
!202 = !DILocation(line: 147, column: 30, scope: !198)
!203 = !DILocalVariable(name: "dest", scope: !198, file: !15, line: 148, type: !6)
!204 = !DILocation(line: 148, column: 20, scope: !198)
!205 = !DILocation(line: 148, column: 35, scope: !198)
!206 = !DILocation(line: 149, column: 26, scope: !198)
!207 = !DILocation(line: 149, column: 32, scope: !198)
!208 = !DILocation(line: 149, column: 19, scope: !198)
!209 = !DILocation(line: 150, column: 31, scope: !198)
!210 = !DILocation(line: 150, column: 13, scope: !198)
!211 = !DILocation(line: 152, column: 5, scope: !199)
!212 = !DILocation(line: 153, column: 1, scope: !182)
