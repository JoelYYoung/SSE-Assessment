; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [43 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 4
@.str.1 = private unnamed_addr constant [43 x i8] c"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_12_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  %dataLen7 = alloca i64, align 8
  %dest9 = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !25
  %tobool = icmp ne i32 %call, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.else, !dbg !27

if.then:                                          ; preds = %entry
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !28
  br label %if.end, !dbg !30

if.else:                                          ; preds = %entry
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.1, i64 0, i64 0), i8** %data, align 8, !dbg !31
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !33
  %tobool2 = icmp ne i32 %call1, 0, !dbg !33
  br i1 %tobool2, label %if.then3, label %if.else6, !dbg !35

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !36, metadata !DIExpression()), !dbg !41
  %0 = load i8*, i8** %data, align 8, !dbg !42
  %call4 = call i64 @strlen(i8* %0) #5, !dbg !43
  store i64 %call4, i64* %dataLen, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !44, metadata !DIExpression()), !dbg !45
  %1 = load i64, i64* %dataLen, align 8, !dbg !46
  %add = add i64 %1, 1, !dbg !46
  %mul = mul i64 %add, 4, !dbg !46
  %2 = alloca i8, i64 %mul, align 16, !dbg !46
  store i8* %2, i8** %dest, align 8, !dbg !45
  %3 = load i8*, i8** %dest, align 8, !dbg !47
  %4 = bitcast i8* %3 to i32*, !dbg !47
  %5 = load i8*, i8** %data, align 8, !dbg !48
  %6 = bitcast i8* %5 to i32*, !dbg !48
  %call5 = call i32* @wcscpy(i32* %4, i32* %6) #6, !dbg !49
  %7 = load i8*, i8** %dest, align 8, !dbg !50
  call void @printLine(i8* %7), !dbg !51
  br label %if.end13, !dbg !52

if.else6:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %dataLen7, metadata !53, metadata !DIExpression()), !dbg !56
  %8 = load i8*, i8** %data, align 8, !dbg !57
  %9 = bitcast i8* %8 to i32*, !dbg !58
  %call8 = call i64 @wcslen(i32* %9) #5, !dbg !59
  store i64 %call8, i64* %dataLen7, align 8, !dbg !56
  call void @llvm.dbg.declare(metadata i8** %dest9, metadata !60, metadata !DIExpression()), !dbg !61
  %10 = load i64, i64* %dataLen7, align 8, !dbg !62
  %add10 = add i64 %10, 1, !dbg !62
  %mul11 = mul i64 %add10, 4, !dbg !62
  %11 = alloca i8, i64 %mul11, align 16, !dbg !62
  store i8* %11, i8** %dest9, align 8, !dbg !61
  %12 = load i8*, i8** %dest9, align 8, !dbg !63
  %13 = bitcast i8* %12 to i32*, !dbg !63
  %14 = load i8*, i8** %data, align 8, !dbg !64
  %15 = bitcast i8* %14 to i32*, !dbg !64
  %call12 = call i32* @wcscpy(i32* %13, i32* %15) #6, !dbg !65
  %16 = load i8*, i8** %dest9, align 8, !dbg !66
  %17 = bitcast i8* %16 to i32*, !dbg !67
  call void @printWLine(i32* %17), !dbg !68
  br label %if.end13

if.end13:                                         ; preds = %if.else6, %if.then3
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_12_good() #0 !dbg !70 {
entry:
  call void @goodB2G(), !dbg !71
  call void @goodG2B(), !dbg !72
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
  %call = call i64 @time(i64* null) #6, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #6, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !85
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_12_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_12_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !92 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  %dataLen7 = alloca i64, align 8
  %dest9 = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !93, metadata !DIExpression()), !dbg !94
  store i8* null, i8** %data, align 8, !dbg !95
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !96
  %tobool = icmp ne i32 %call, 0, !dbg !96
  br i1 %tobool, label %if.then, label %if.else, !dbg !98

if.then:                                          ; preds = %entry
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !99
  br label %if.end, !dbg !101

if.else:                                          ; preds = %entry
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !102
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !104
  %tobool2 = icmp ne i32 %call1, 0, !dbg !104
  br i1 %tobool2, label %if.then3, label %if.else6, !dbg !106

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !107, metadata !DIExpression()), !dbg !110
  %0 = load i8*, i8** %data, align 8, !dbg !111
  %1 = bitcast i8* %0 to i32*, !dbg !112
  %call4 = call i64 @wcslen(i32* %1) #5, !dbg !113
  store i64 %call4, i64* %dataLen, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !114, metadata !DIExpression()), !dbg !115
  %2 = load i64, i64* %dataLen, align 8, !dbg !116
  %add = add i64 %2, 1, !dbg !116
  %mul = mul i64 %add, 4, !dbg !116
  %3 = alloca i8, i64 %mul, align 16, !dbg !116
  store i8* %3, i8** %dest, align 8, !dbg !115
  %4 = load i8*, i8** %dest, align 8, !dbg !117
  %5 = bitcast i8* %4 to i32*, !dbg !117
  %6 = load i8*, i8** %data, align 8, !dbg !118
  %7 = bitcast i8* %6 to i32*, !dbg !118
  %call5 = call i32* @wcscpy(i32* %5, i32* %7) #6, !dbg !119
  %8 = load i8*, i8** %dest, align 8, !dbg !120
  %9 = bitcast i8* %8 to i32*, !dbg !121
  call void @printWLine(i32* %9), !dbg !122
  br label %if.end13, !dbg !123

if.else6:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %dataLen7, metadata !124, metadata !DIExpression()), !dbg !127
  %10 = load i8*, i8** %data, align 8, !dbg !128
  %11 = bitcast i8* %10 to i32*, !dbg !129
  %call8 = call i64 @wcslen(i32* %11) #5, !dbg !130
  store i64 %call8, i64* %dataLen7, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata i8** %dest9, metadata !131, metadata !DIExpression()), !dbg !132
  %12 = load i64, i64* %dataLen7, align 8, !dbg !133
  %add10 = add i64 %12, 1, !dbg !133
  %mul11 = mul i64 %add10, 4, !dbg !133
  %13 = alloca i8, i64 %mul11, align 16, !dbg !133
  store i8* %13, i8** %dest9, align 8, !dbg !132
  %14 = load i8*, i8** %dest9, align 8, !dbg !134
  %15 = bitcast i8* %14 to i32*, !dbg !134
  %16 = load i8*, i8** %data, align 8, !dbg !135
  %17 = bitcast i8* %16 to i32*, !dbg !135
  %call12 = call i32* @wcscpy(i32* %15, i32* %17) #6, !dbg !136
  %18 = load i8*, i8** %dest9, align 8, !dbg !137
  %19 = bitcast i8* %18 to i32*, !dbg !138
  call void @printWLine(i32* %19), !dbg !139
  br label %if.end13

if.end13:                                         ; preds = %if.else6, %if.then3
  ret void, !dbg !140
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !141 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  %dataLen7 = alloca i64, align 8
  %dest9 = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !142, metadata !DIExpression()), !dbg !143
  store i8* null, i8** %data, align 8, !dbg !144
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !145
  %tobool = icmp ne i32 %call, 0, !dbg !145
  br i1 %tobool, label %if.then, label %if.else, !dbg !147

if.then:                                          ; preds = %entry
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.1, i64 0, i64 0), i8** %data, align 8, !dbg !148
  br label %if.end, !dbg !150

if.else:                                          ; preds = %entry
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.1, i64 0, i64 0), i8** %data, align 8, !dbg !151
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !153
  %tobool2 = icmp ne i32 %call1, 0, !dbg !153
  br i1 %tobool2, label %if.then3, label %if.else6, !dbg !155

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !156, metadata !DIExpression()), !dbg !159
  %0 = load i8*, i8** %data, align 8, !dbg !160
  %call4 = call i64 @strlen(i8* %0) #5, !dbg !161
  store i64 %call4, i64* %dataLen, align 8, !dbg !159
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !162, metadata !DIExpression()), !dbg !163
  %1 = load i64, i64* %dataLen, align 8, !dbg !164
  %add = add i64 %1, 1, !dbg !164
  %mul = mul i64 %add, 1, !dbg !164
  %2 = alloca i8, i64 %mul, align 16, !dbg !164
  store i8* %2, i8** %dest, align 8, !dbg !163
  %3 = load i8*, i8** %dest, align 8, !dbg !165
  %4 = load i8*, i8** %data, align 8, !dbg !166
  %call5 = call i8* @strcpy(i8* %3, i8* %4) #6, !dbg !167
  %5 = load i8*, i8** %dest, align 8, !dbg !168
  call void @printLine(i8* %5), !dbg !169
  br label %if.end13, !dbg !170

if.else6:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %dataLen7, metadata !171, metadata !DIExpression()), !dbg !174
  %6 = load i8*, i8** %data, align 8, !dbg !175
  %call8 = call i64 @strlen(i8* %6) #5, !dbg !176
  store i64 %call8, i64* %dataLen7, align 8, !dbg !174
  call void @llvm.dbg.declare(metadata i8** %dest9, metadata !177, metadata !DIExpression()), !dbg !178
  %7 = load i64, i64* %dataLen7, align 8, !dbg !179
  %add10 = add i64 %7, 1, !dbg !179
  %mul11 = mul i64 %add10, 1, !dbg !179
  %8 = alloca i8, i64 %mul11, align 16, !dbg !179
  store i8* %8, i8** %dest9, align 8, !dbg !178
  %9 = load i8*, i8** %dest9, align 8, !dbg !180
  %10 = load i8*, i8** %data, align 8, !dbg !181
  %call12 = call i8* @strcpy(i8* %9, i8* %10) #6, !dbg !182
  %11 = load i8*, i8** %dest9, align 8, !dbg !183
  call void @printLine(i8* %11), !dbg !184
  br label %if.end13

if.end13:                                         ; preds = %if.else6, %if.then3
  ret void, !dbg !185
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_12.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !7, !11}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !9, line: 74, baseType: !10)
!9 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_12_bad", scope: !19, file: !19, line: 27, type: !20, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_12.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 29, type: !4)
!23 = !DILocation(line: 29, column: 12, scope: !18)
!24 = !DILocation(line: 30, column: 10, scope: !18)
!25 = !DILocation(line: 31, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !18, file: !19, line: 31, column: 8)
!27 = !DILocation(line: 31, column: 8, scope: !18)
!28 = !DILocation(line: 34, column: 14, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !19, line: 32, column: 5)
!30 = !DILocation(line: 35, column: 5, scope: !29)
!31 = !DILocation(line: 39, column: 14, scope: !32)
!32 = distinct !DILexicalBlock(scope: !26, file: !19, line: 37, column: 5)
!33 = !DILocation(line: 41, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !18, file: !19, line: 41, column: 8)
!35 = !DILocation(line: 41, column: 8, scope: !18)
!36 = !DILocalVariable(name: "dataLen", scope: !37, file: !19, line: 45, type: !39)
!37 = distinct !DILexicalBlock(scope: !38, file: !19, line: 43, column: 9)
!38 = distinct !DILexicalBlock(scope: !34, file: !19, line: 42, column: 5)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !9, line: 46, baseType: !40)
!40 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 45, column: 20, scope: !37)
!42 = !DILocation(line: 45, column: 45, scope: !37)
!43 = !DILocation(line: 45, column: 30, scope: !37)
!44 = !DILocalVariable(name: "dest", scope: !37, file: !19, line: 46, type: !4)
!45 = !DILocation(line: 46, column: 20, scope: !37)
!46 = !DILocation(line: 46, column: 35, scope: !37)
!47 = !DILocation(line: 47, column: 26, scope: !37)
!48 = !DILocation(line: 47, column: 32, scope: !37)
!49 = !DILocation(line: 47, column: 19, scope: !37)
!50 = !DILocation(line: 48, column: 31, scope: !37)
!51 = !DILocation(line: 48, column: 13, scope: !37)
!52 = !DILocation(line: 50, column: 5, scope: !38)
!53 = !DILocalVariable(name: "dataLen", scope: !54, file: !19, line: 55, type: !39)
!54 = distinct !DILexicalBlock(scope: !55, file: !19, line: 53, column: 9)
!55 = distinct !DILexicalBlock(scope: !34, file: !19, line: 52, column: 5)
!56 = !DILocation(line: 55, column: 20, scope: !54)
!57 = !DILocation(line: 55, column: 48, scope: !54)
!58 = !DILocation(line: 55, column: 37, scope: !54)
!59 = !DILocation(line: 55, column: 30, scope: !54)
!60 = !DILocalVariable(name: "dest", scope: !54, file: !19, line: 56, type: !4)
!61 = !DILocation(line: 56, column: 20, scope: !54)
!62 = !DILocation(line: 56, column: 35, scope: !54)
!63 = !DILocation(line: 57, column: 26, scope: !54)
!64 = !DILocation(line: 57, column: 32, scope: !54)
!65 = !DILocation(line: 57, column: 19, scope: !54)
!66 = !DILocation(line: 58, column: 35, scope: !54)
!67 = !DILocation(line: 58, column: 24, scope: !54)
!68 = !DILocation(line: 58, column: 13, scope: !54)
!69 = !DILocation(line: 61, column: 1, scope: !18)
!70 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_12_good", scope: !19, file: !19, line: 145, type: !20, scopeLine: 146, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 147, column: 5, scope: !70)
!72 = !DILocation(line: 148, column: 5, scope: !70)
!73 = !DILocation(line: 149, column: 1, scope: !70)
!74 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 160, type: !75, scopeLine: 161, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!10, !10, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !19, line: 160, type: !10)
!79 = !DILocation(line: 160, column: 14, scope: !74)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !19, line: 160, type: !77)
!81 = !DILocation(line: 160, column: 27, scope: !74)
!82 = !DILocation(line: 163, column: 22, scope: !74)
!83 = !DILocation(line: 163, column: 12, scope: !74)
!84 = !DILocation(line: 163, column: 5, scope: !74)
!85 = !DILocation(line: 165, column: 5, scope: !74)
!86 = !DILocation(line: 166, column: 5, scope: !74)
!87 = !DILocation(line: 167, column: 5, scope: !74)
!88 = !DILocation(line: 170, column: 5, scope: !74)
!89 = !DILocation(line: 171, column: 5, scope: !74)
!90 = !DILocation(line: 172, column: 5, scope: !74)
!91 = !DILocation(line: 174, column: 5, scope: !74)
!92 = distinct !DISubprogram(name: "goodB2G", scope: !19, file: !19, line: 70, type: !20, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "data", scope: !92, file: !19, line: 72, type: !4)
!94 = !DILocation(line: 72, column: 12, scope: !92)
!95 = !DILocation(line: 73, column: 10, scope: !92)
!96 = !DILocation(line: 74, column: 8, scope: !97)
!97 = distinct !DILexicalBlock(scope: !92, file: !19, line: 74, column: 8)
!98 = !DILocation(line: 74, column: 8, scope: !92)
!99 = !DILocation(line: 77, column: 14, scope: !100)
!100 = distinct !DILexicalBlock(scope: !97, file: !19, line: 75, column: 5)
!101 = !DILocation(line: 78, column: 5, scope: !100)
!102 = !DILocation(line: 82, column: 14, scope: !103)
!103 = distinct !DILexicalBlock(scope: !97, file: !19, line: 80, column: 5)
!104 = !DILocation(line: 84, column: 8, scope: !105)
!105 = distinct !DILexicalBlock(scope: !92, file: !19, line: 84, column: 8)
!106 = !DILocation(line: 84, column: 8, scope: !92)
!107 = !DILocalVariable(name: "dataLen", scope: !108, file: !19, line: 88, type: !39)
!108 = distinct !DILexicalBlock(scope: !109, file: !19, line: 86, column: 9)
!109 = distinct !DILexicalBlock(scope: !105, file: !19, line: 85, column: 5)
!110 = !DILocation(line: 88, column: 20, scope: !108)
!111 = !DILocation(line: 88, column: 48, scope: !108)
!112 = !DILocation(line: 88, column: 37, scope: !108)
!113 = !DILocation(line: 88, column: 30, scope: !108)
!114 = !DILocalVariable(name: "dest", scope: !108, file: !19, line: 89, type: !4)
!115 = !DILocation(line: 89, column: 20, scope: !108)
!116 = !DILocation(line: 89, column: 35, scope: !108)
!117 = !DILocation(line: 90, column: 26, scope: !108)
!118 = !DILocation(line: 90, column: 32, scope: !108)
!119 = !DILocation(line: 90, column: 19, scope: !108)
!120 = !DILocation(line: 91, column: 35, scope: !108)
!121 = !DILocation(line: 91, column: 24, scope: !108)
!122 = !DILocation(line: 91, column: 13, scope: !108)
!123 = !DILocation(line: 93, column: 5, scope: !109)
!124 = !DILocalVariable(name: "dataLen", scope: !125, file: !19, line: 98, type: !39)
!125 = distinct !DILexicalBlock(scope: !126, file: !19, line: 96, column: 9)
!126 = distinct !DILexicalBlock(scope: !105, file: !19, line: 95, column: 5)
!127 = !DILocation(line: 98, column: 20, scope: !125)
!128 = !DILocation(line: 98, column: 48, scope: !125)
!129 = !DILocation(line: 98, column: 37, scope: !125)
!130 = !DILocation(line: 98, column: 30, scope: !125)
!131 = !DILocalVariable(name: "dest", scope: !125, file: !19, line: 99, type: !4)
!132 = !DILocation(line: 99, column: 20, scope: !125)
!133 = !DILocation(line: 99, column: 35, scope: !125)
!134 = !DILocation(line: 100, column: 26, scope: !125)
!135 = !DILocation(line: 100, column: 32, scope: !125)
!136 = !DILocation(line: 100, column: 19, scope: !125)
!137 = !DILocation(line: 101, column: 35, scope: !125)
!138 = !DILocation(line: 101, column: 24, scope: !125)
!139 = !DILocation(line: 101, column: 13, scope: !125)
!140 = !DILocation(line: 104, column: 1, scope: !92)
!141 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 109, type: !20, scopeLine: 110, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!142 = !DILocalVariable(name: "data", scope: !141, file: !19, line: 111, type: !4)
!143 = !DILocation(line: 111, column: 12, scope: !141)
!144 = !DILocation(line: 112, column: 10, scope: !141)
!145 = !DILocation(line: 113, column: 8, scope: !146)
!146 = distinct !DILexicalBlock(scope: !141, file: !19, line: 113, column: 8)
!147 = !DILocation(line: 113, column: 8, scope: !141)
!148 = !DILocation(line: 116, column: 14, scope: !149)
!149 = distinct !DILexicalBlock(scope: !146, file: !19, line: 114, column: 5)
!150 = !DILocation(line: 117, column: 5, scope: !149)
!151 = !DILocation(line: 121, column: 14, scope: !152)
!152 = distinct !DILexicalBlock(scope: !146, file: !19, line: 119, column: 5)
!153 = !DILocation(line: 123, column: 8, scope: !154)
!154 = distinct !DILexicalBlock(scope: !141, file: !19, line: 123, column: 8)
!155 = !DILocation(line: 123, column: 8, scope: !141)
!156 = !DILocalVariable(name: "dataLen", scope: !157, file: !19, line: 127, type: !39)
!157 = distinct !DILexicalBlock(scope: !158, file: !19, line: 125, column: 9)
!158 = distinct !DILexicalBlock(scope: !154, file: !19, line: 124, column: 5)
!159 = !DILocation(line: 127, column: 20, scope: !157)
!160 = !DILocation(line: 127, column: 45, scope: !157)
!161 = !DILocation(line: 127, column: 30, scope: !157)
!162 = !DILocalVariable(name: "dest", scope: !157, file: !19, line: 128, type: !4)
!163 = !DILocation(line: 128, column: 20, scope: !157)
!164 = !DILocation(line: 128, column: 35, scope: !157)
!165 = !DILocation(line: 129, column: 26, scope: !157)
!166 = !DILocation(line: 129, column: 32, scope: !157)
!167 = !DILocation(line: 129, column: 19, scope: !157)
!168 = !DILocation(line: 130, column: 31, scope: !157)
!169 = !DILocation(line: 130, column: 13, scope: !157)
!170 = !DILocation(line: 132, column: 5, scope: !158)
!171 = !DILocalVariable(name: "dataLen", scope: !172, file: !19, line: 137, type: !39)
!172 = distinct !DILexicalBlock(scope: !173, file: !19, line: 135, column: 9)
!173 = distinct !DILexicalBlock(scope: !154, file: !19, line: 134, column: 5)
!174 = !DILocation(line: 137, column: 20, scope: !172)
!175 = !DILocation(line: 137, column: 45, scope: !172)
!176 = !DILocation(line: 137, column: 30, scope: !172)
!177 = !DILocalVariable(name: "dest", scope: !172, file: !19, line: 138, type: !4)
!178 = !DILocation(line: 138, column: 20, scope: !172)
!179 = !DILocation(line: 138, column: 35, scope: !172)
!180 = !DILocation(line: 139, column: 26, scope: !172)
!181 = !DILocation(line: 139, column: 32, scope: !172)
!182 = !DILocation(line: 139, column: 19, scope: !172)
!183 = !DILocation(line: 140, column: 31, scope: !172)
!184 = !DILocation(line: 140, column: 13, scope: !172)
!185 = !DILocation(line: 143, column: 1, scope: !141)
