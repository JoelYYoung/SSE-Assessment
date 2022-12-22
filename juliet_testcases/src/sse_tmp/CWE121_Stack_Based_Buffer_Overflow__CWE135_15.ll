; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [43 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [43 x i8] c"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_15_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !26, metadata !DIExpression()), !dbg !30
  %0 = load i8*, i8** %data, align 8, !dbg !31
  %call = call i64 @strlen(i8* %0) #5, !dbg !32
  store i64 %call, i64* %dataLen, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !33, metadata !DIExpression()), !dbg !34
  %1 = load i64, i64* %dataLen, align 8, !dbg !35
  %add = add i64 %1, 1, !dbg !35
  %mul = mul i64 %add, 4, !dbg !35
  %2 = alloca i8, i64 %mul, align 16, !dbg !35
  store i8* %2, i8** %dest, align 8, !dbg !34
  %3 = load i8*, i8** %dest, align 8, !dbg !36
  %4 = bitcast i8* %3 to i32*, !dbg !36
  %5 = load i8*, i8** %data, align 8, !dbg !37
  %6 = bitcast i8* %5 to i32*, !dbg !37
  %call1 = call i32* @wcscpy(i32* %4, i32* %6) #6, !dbg !38
  %7 = load i8*, i8** %dest, align 8, !dbg !39
  call void @printLine(i8* %7), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_15_good() #0 !dbg !42 {
entry:
  call void @goodB2G1(), !dbg !43
  call void @goodB2G2(), !dbg !44
  call void @goodG2B1(), !dbg !45
  call void @goodG2B2(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !52, metadata !DIExpression()), !dbg !53
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %call = call i64 @time(i64* null) #6, !dbg !56
  %conv = trunc i64 %call to i32, !dbg !57
  call void @srand(i32 %conv) #6, !dbg !58
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !59
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_15_good(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_15_bad(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !66 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !67, metadata !DIExpression()), !dbg !68
  store i8* null, i8** %data, align 8, !dbg !69
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !71, metadata !DIExpression()), !dbg !73
  %0 = load i8*, i8** %data, align 8, !dbg !74
  %1 = bitcast i8* %0 to i32*, !dbg !75
  %call = call i64 @wcslen(i32* %1) #5, !dbg !76
  store i64 %call, i64* %dataLen, align 8, !dbg !73
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !77, metadata !DIExpression()), !dbg !78
  %2 = load i64, i64* %dataLen, align 8, !dbg !79
  %add = add i64 %2, 1, !dbg !79
  %mul = mul i64 %add, 4, !dbg !79
  %3 = alloca i8, i64 %mul, align 16, !dbg !79
  store i8* %3, i8** %dest, align 8, !dbg !78
  %4 = load i8*, i8** %dest, align 8, !dbg !80
  %5 = bitcast i8* %4 to i32*, !dbg !80
  %6 = load i8*, i8** %data, align 8, !dbg !81
  %7 = bitcast i8* %6 to i32*, !dbg !81
  %call1 = call i32* @wcscpy(i32* %5, i32* %7) #6, !dbg !82
  %8 = load i8*, i8** %dest, align 8, !dbg !83
  %9 = bitcast i8* %8 to i32*, !dbg !84
  call void @printWLine(i32* %9), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !87 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !88, metadata !DIExpression()), !dbg !89
  store i8* null, i8** %data, align 8, !dbg !90
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !92, metadata !DIExpression()), !dbg !94
  %0 = load i8*, i8** %data, align 8, !dbg !95
  %1 = bitcast i8* %0 to i32*, !dbg !96
  %call = call i64 @wcslen(i32* %1) #5, !dbg !97
  store i64 %call, i64* %dataLen, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !98, metadata !DIExpression()), !dbg !99
  %2 = load i64, i64* %dataLen, align 8, !dbg !100
  %add = add i64 %2, 1, !dbg !100
  %mul = mul i64 %add, 4, !dbg !100
  %3 = alloca i8, i64 %mul, align 16, !dbg !100
  store i8* %3, i8** %dest, align 8, !dbg !99
  %4 = load i8*, i8** %dest, align 8, !dbg !101
  %5 = bitcast i8* %4 to i32*, !dbg !101
  %6 = load i8*, i8** %data, align 8, !dbg !102
  %7 = bitcast i8* %6 to i32*, !dbg !102
  %call1 = call i32* @wcscpy(i32* %5, i32* %7) #6, !dbg !103
  %8 = load i8*, i8** %dest, align 8, !dbg !104
  %9 = bitcast i8* %8 to i32*, !dbg !105
  call void @printWLine(i32* %9), !dbg !106
  ret void, !dbg !107
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !108 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !109, metadata !DIExpression()), !dbg !110
  store i8* null, i8** %data, align 8, !dbg !111
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.5, i64 0, i64 0), i8** %data, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !113, metadata !DIExpression()), !dbg !115
  %0 = load i8*, i8** %data, align 8, !dbg !116
  %call = call i64 @strlen(i8* %0) #5, !dbg !117
  store i64 %call, i64* %dataLen, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !118, metadata !DIExpression()), !dbg !119
  %1 = load i64, i64* %dataLen, align 8, !dbg !120
  %add = add i64 %1, 1, !dbg !120
  %mul = mul i64 %add, 1, !dbg !120
  %2 = alloca i8, i64 %mul, align 16, !dbg !120
  store i8* %2, i8** %dest, align 8, !dbg !119
  %3 = load i8*, i8** %dest, align 8, !dbg !121
  %4 = load i8*, i8** %data, align 8, !dbg !122
  %call1 = call i8* @strcpy(i8* %3, i8* %4) #6, !dbg !123
  %5 = load i8*, i8** %dest, align 8, !dbg !124
  call void @printLine(i8* %5), !dbg !125
  ret void, !dbg !126
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !127 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !128, metadata !DIExpression()), !dbg !129
  store i8* null, i8** %data, align 8, !dbg !130
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.5, i64 0, i64 0), i8** %data, align 8, !dbg !131
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !132, metadata !DIExpression()), !dbg !134
  %0 = load i8*, i8** %data, align 8, !dbg !135
  %call = call i64 @strlen(i8* %0) #5, !dbg !136
  store i64 %call, i64* %dataLen, align 8, !dbg !134
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !137, metadata !DIExpression()), !dbg !138
  %1 = load i64, i64* %dataLen, align 8, !dbg !139
  %add = add i64 %1, 1, !dbg !139
  %mul = mul i64 %add, 1, !dbg !139
  %2 = alloca i8, i64 %mul, align 16, !dbg !139
  store i8* %2, i8** %dest, align 8, !dbg !138
  %3 = load i8*, i8** %dest, align 8, !dbg !140
  %4 = load i8*, i8** %data, align 8, !dbg !141
  %call1 = call i8* @strcpy(i8* %3, i8* %4) #6, !dbg !142
  %5 = load i8*, i8** %dest, align 8, !dbg !143
  call void @printLine(i8* %5), !dbg !144
  ret void, !dbg !145
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_15.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !7, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !10, line: 74, baseType: !11)
!10 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_15_bad", scope: !19, file: !19, line: 27, type: !20, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_15.c", directory: "/root/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 29, type: !4)
!23 = !DILocation(line: 29, column: 12, scope: !18)
!24 = !DILocation(line: 30, column: 10, scope: !18)
!25 = !DILocation(line: 35, column: 14, scope: !18)
!26 = !DILocalVariable(name: "dataLen", scope: !27, file: !19, line: 47, type: !28)
!27 = distinct !DILexicalBlock(scope: !18, file: !19, line: 45, column: 5)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !10, line: 46, baseType: !29)
!29 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!30 = !DILocation(line: 47, column: 16, scope: !27)
!31 = !DILocation(line: 47, column: 41, scope: !27)
!32 = !DILocation(line: 47, column: 26, scope: !27)
!33 = !DILocalVariable(name: "dest", scope: !27, file: !19, line: 48, type: !4)
!34 = !DILocation(line: 48, column: 16, scope: !27)
!35 = !DILocation(line: 48, column: 31, scope: !27)
!36 = !DILocation(line: 49, column: 22, scope: !27)
!37 = !DILocation(line: 49, column: 28, scope: !27)
!38 = !DILocation(line: 49, column: 15, scope: !27)
!39 = !DILocation(line: 50, column: 27, scope: !27)
!40 = !DILocation(line: 50, column: 9, scope: !27)
!41 = !DILocation(line: 58, column: 1, scope: !18)
!42 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_15_good", scope: !19, file: !19, line: 200, type: !20, scopeLine: 201, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocation(line: 202, column: 5, scope: !42)
!44 = !DILocation(line: 203, column: 5, scope: !42)
!45 = !DILocation(line: 204, column: 5, scope: !42)
!46 = !DILocation(line: 205, column: 5, scope: !42)
!47 = !DILocation(line: 206, column: 1, scope: !42)
!48 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 217, type: !49, scopeLine: 218, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{!11, !11, !51}
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !19, line: 217, type: !11)
!53 = !DILocation(line: 217, column: 14, scope: !48)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !19, line: 217, type: !51)
!55 = !DILocation(line: 217, column: 27, scope: !48)
!56 = !DILocation(line: 220, column: 22, scope: !48)
!57 = !DILocation(line: 220, column: 12, scope: !48)
!58 = !DILocation(line: 220, column: 5, scope: !48)
!59 = !DILocation(line: 222, column: 5, scope: !48)
!60 = !DILocation(line: 223, column: 5, scope: !48)
!61 = !DILocation(line: 224, column: 5, scope: !48)
!62 = !DILocation(line: 227, column: 5, scope: !48)
!63 = !DILocation(line: 228, column: 5, scope: !48)
!64 = !DILocation(line: 229, column: 5, scope: !48)
!65 = !DILocation(line: 231, column: 5, scope: !48)
!66 = distinct !DISubprogram(name: "goodB2G1", scope: !19, file: !19, line: 65, type: !20, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocalVariable(name: "data", scope: !66, file: !19, line: 67, type: !4)
!68 = !DILocation(line: 67, column: 12, scope: !66)
!69 = !DILocation(line: 68, column: 10, scope: !66)
!70 = !DILocation(line: 73, column: 14, scope: !66)
!71 = !DILocalVariable(name: "dataLen", scope: !72, file: !19, line: 89, type: !28)
!72 = distinct !DILexicalBlock(scope: !66, file: !19, line: 87, column: 5)
!73 = !DILocation(line: 89, column: 16, scope: !72)
!74 = !DILocation(line: 89, column: 44, scope: !72)
!75 = !DILocation(line: 89, column: 33, scope: !72)
!76 = !DILocation(line: 89, column: 26, scope: !72)
!77 = !DILocalVariable(name: "dest", scope: !72, file: !19, line: 90, type: !4)
!78 = !DILocation(line: 90, column: 16, scope: !72)
!79 = !DILocation(line: 90, column: 31, scope: !72)
!80 = !DILocation(line: 91, column: 22, scope: !72)
!81 = !DILocation(line: 91, column: 28, scope: !72)
!82 = !DILocation(line: 91, column: 15, scope: !72)
!83 = !DILocation(line: 92, column: 31, scope: !72)
!84 = !DILocation(line: 92, column: 20, scope: !72)
!85 = !DILocation(line: 92, column: 9, scope: !72)
!86 = !DILocation(line: 96, column: 1, scope: !66)
!87 = distinct !DISubprogram(name: "goodB2G2", scope: !19, file: !19, line: 99, type: !20, scopeLine: 100, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !19, line: 101, type: !4)
!89 = !DILocation(line: 101, column: 12, scope: !87)
!90 = !DILocation(line: 102, column: 10, scope: !87)
!91 = !DILocation(line: 107, column: 14, scope: !87)
!92 = !DILocalVariable(name: "dataLen", scope: !93, file: !19, line: 119, type: !28)
!93 = distinct !DILexicalBlock(scope: !87, file: !19, line: 117, column: 5)
!94 = !DILocation(line: 119, column: 16, scope: !93)
!95 = !DILocation(line: 119, column: 44, scope: !93)
!96 = !DILocation(line: 119, column: 33, scope: !93)
!97 = !DILocation(line: 119, column: 26, scope: !93)
!98 = !DILocalVariable(name: "dest", scope: !93, file: !19, line: 120, type: !4)
!99 = !DILocation(line: 120, column: 16, scope: !93)
!100 = !DILocation(line: 120, column: 31, scope: !93)
!101 = !DILocation(line: 121, column: 22, scope: !93)
!102 = !DILocation(line: 121, column: 28, scope: !93)
!103 = !DILocation(line: 121, column: 15, scope: !93)
!104 = !DILocation(line: 122, column: 31, scope: !93)
!105 = !DILocation(line: 122, column: 20, scope: !93)
!106 = !DILocation(line: 122, column: 9, scope: !93)
!107 = !DILocation(line: 130, column: 1, scope: !87)
!108 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 133, type: !20, scopeLine: 134, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", scope: !108, file: !19, line: 135, type: !4)
!110 = !DILocation(line: 135, column: 12, scope: !108)
!111 = !DILocation(line: 136, column: 10, scope: !108)
!112 = !DILocation(line: 145, column: 14, scope: !108)
!113 = !DILocalVariable(name: "dataLen", scope: !114, file: !19, line: 153, type: !28)
!114 = distinct !DILexicalBlock(scope: !108, file: !19, line: 151, column: 5)
!115 = !DILocation(line: 153, column: 16, scope: !114)
!116 = !DILocation(line: 153, column: 41, scope: !114)
!117 = !DILocation(line: 153, column: 26, scope: !114)
!118 = !DILocalVariable(name: "dest", scope: !114, file: !19, line: 154, type: !4)
!119 = !DILocation(line: 154, column: 16, scope: !114)
!120 = !DILocation(line: 154, column: 31, scope: !114)
!121 = !DILocation(line: 155, column: 22, scope: !114)
!122 = !DILocation(line: 155, column: 28, scope: !114)
!123 = !DILocation(line: 155, column: 15, scope: !114)
!124 = !DILocation(line: 156, column: 27, scope: !114)
!125 = !DILocation(line: 156, column: 9, scope: !114)
!126 = !DILocation(line: 164, column: 1, scope: !108)
!127 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 167, type: !20, scopeLine: 168, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!128 = !DILocalVariable(name: "data", scope: !127, file: !19, line: 169, type: !4)
!129 = !DILocation(line: 169, column: 12, scope: !127)
!130 = !DILocation(line: 170, column: 10, scope: !127)
!131 = !DILocation(line: 175, column: 14, scope: !127)
!132 = !DILocalVariable(name: "dataLen", scope: !133, file: !19, line: 187, type: !28)
!133 = distinct !DILexicalBlock(scope: !127, file: !19, line: 185, column: 5)
!134 = !DILocation(line: 187, column: 16, scope: !133)
!135 = !DILocation(line: 187, column: 41, scope: !133)
!136 = !DILocation(line: 187, column: 26, scope: !133)
!137 = !DILocalVariable(name: "dest", scope: !133, file: !19, line: 188, type: !4)
!138 = !DILocation(line: 188, column: 16, scope: !133)
!139 = !DILocation(line: 188, column: 31, scope: !133)
!140 = !DILocation(line: 189, column: 22, scope: !133)
!141 = !DILocation(line: 189, column: 28, scope: !133)
!142 = !DILocation(line: 189, column: 15, scope: !133)
!143 = !DILocation(line: 190, column: 27, scope: !133)
!144 = !DILocation(line: 190, column: 9, scope: !133)
!145 = !DILocation(line: 198, column: 1, scope: !127)
