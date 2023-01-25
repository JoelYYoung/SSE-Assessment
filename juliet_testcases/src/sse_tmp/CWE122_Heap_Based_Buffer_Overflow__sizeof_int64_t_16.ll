; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_16.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_16_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i64* null, i64** %data, align 8, !dbg !24
  br label %while.body, !dbg !25

while.body:                                       ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !26
  %0 = bitcast i8* %call to i64*, !dbg !28
  store i64* %0, i64** %data, align 8, !dbg !29
  %1 = load i64*, i64** %data, align 8, !dbg !30
  %cmp = icmp eq i64* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #6, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %while.body
  %2 = load i64*, i64** %data, align 8, !dbg !36
  store i64 2147483643, i64* %2, align 8, !dbg !37
  br label %while.end, !dbg !38

while.end:                                        ; preds = %if.end
  %3 = load i64*, i64** %data, align 8, !dbg !39
  %4 = load i64, i64* %3, align 8, !dbg !40
  call void @printLongLongLine(i64 %4), !dbg !41
  %5 = load i64*, i64** %data, align 8, !dbg !42
  %6 = bitcast i64* %5 to i8*, !dbg !42
  call void @free(i8* %6) #5, !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_16_good() #0 !dbg !45 {
entry:
  call void @goodG2B(), !dbg !46
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* null) #5, !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 %conv) #5, !dbg !61
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_16_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_16_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !69 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !70, metadata !DIExpression()), !dbg !71
  store i64* null, i64** %data, align 8, !dbg !72
  br label %while.body, !dbg !73

while.body:                                       ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !74
  %0 = bitcast i8* %call to i64*, !dbg !76
  store i64* %0, i64** %data, align 8, !dbg !77
  %1 = load i64*, i64** %data, align 8, !dbg !78
  %cmp = icmp eq i64* %1, null, !dbg !80
  br i1 %cmp, label %if.then, label %if.end, !dbg !81

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #6, !dbg !82
  unreachable, !dbg !82

if.end:                                           ; preds = %while.body
  %2 = load i64*, i64** %data, align 8, !dbg !84
  store i64 2147483643, i64* %2, align 8, !dbg !85
  br label %while.end, !dbg !86

while.end:                                        ; preds = %if.end
  %3 = load i64*, i64** %data, align 8, !dbg !87
  %4 = load i64, i64* %3, align 8, !dbg !88
  call void @printLongLongLine(i64 %4), !dbg !89
  %5 = load i64*, i64** %data, align 8, !dbg !90
  %6 = bitcast i64* %5 to i8*, !dbg !90
  call void @free(i8* %6) #5, !dbg !91
  ret void, !dbg !92
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_16.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !10, !11}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 27, baseType: !7)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 44, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!9 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_16_bad", scope: !19, file: !19, line: 21, type: !20, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_16.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 23, type: !4)
!23 = !DILocation(line: 23, column: 15, scope: !18)
!24 = !DILocation(line: 25, column: 10, scope: !18)
!25 = !DILocation(line: 26, column: 5, scope: !18)
!26 = !DILocation(line: 30, column: 27, scope: !27)
!27 = distinct !DILexicalBlock(scope: !18, file: !19, line: 27, column: 5)
!28 = !DILocation(line: 30, column: 16, scope: !27)
!29 = !DILocation(line: 30, column: 14, scope: !27)
!30 = !DILocation(line: 31, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !19, line: 31, column: 13)
!32 = !DILocation(line: 31, column: 18, scope: !31)
!33 = !DILocation(line: 31, column: 13, scope: !27)
!34 = !DILocation(line: 31, column: 28, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !19, line: 31, column: 27)
!36 = !DILocation(line: 32, column: 10, scope: !27)
!37 = !DILocation(line: 32, column: 15, scope: !27)
!38 = !DILocation(line: 33, column: 9, scope: !27)
!39 = !DILocation(line: 36, column: 24, scope: !18)
!40 = !DILocation(line: 36, column: 23, scope: !18)
!41 = !DILocation(line: 36, column: 5, scope: !18)
!42 = !DILocation(line: 37, column: 10, scope: !18)
!43 = !DILocation(line: 37, column: 5, scope: !18)
!44 = !DILocation(line: 38, column: 1, scope: !18)
!45 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_16_good", scope: !19, file: !19, line: 63, type: !20, scopeLine: 64, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DILocation(line: 65, column: 5, scope: !45)
!47 = !DILocation(line: 66, column: 1, scope: !45)
!48 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 78, type: !49, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{!51, !51, !52}
!51 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !19, line: 78, type: !51)
!56 = !DILocation(line: 78, column: 14, scope: !48)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !19, line: 78, type: !52)
!58 = !DILocation(line: 78, column: 27, scope: !48)
!59 = !DILocation(line: 81, column: 22, scope: !48)
!60 = !DILocation(line: 81, column: 12, scope: !48)
!61 = !DILocation(line: 81, column: 5, scope: !48)
!62 = !DILocation(line: 83, column: 5, scope: !48)
!63 = !DILocation(line: 84, column: 5, scope: !48)
!64 = !DILocation(line: 85, column: 5, scope: !48)
!65 = !DILocation(line: 88, column: 5, scope: !48)
!66 = !DILocation(line: 89, column: 5, scope: !48)
!67 = !DILocation(line: 90, column: 5, scope: !48)
!68 = !DILocation(line: 92, column: 5, scope: !48)
!69 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 45, type: !20, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "data", scope: !69, file: !19, line: 47, type: !4)
!71 = !DILocation(line: 47, column: 15, scope: !69)
!72 = !DILocation(line: 49, column: 10, scope: !69)
!73 = !DILocation(line: 50, column: 5, scope: !69)
!74 = !DILocation(line: 53, column: 27, scope: !75)
!75 = distinct !DILexicalBlock(scope: !69, file: !19, line: 51, column: 5)
!76 = !DILocation(line: 53, column: 16, scope: !75)
!77 = !DILocation(line: 53, column: 14, scope: !75)
!78 = !DILocation(line: 54, column: 13, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !19, line: 54, column: 13)
!80 = !DILocation(line: 54, column: 18, scope: !79)
!81 = !DILocation(line: 54, column: 13, scope: !75)
!82 = !DILocation(line: 54, column: 28, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !19, line: 54, column: 27)
!84 = !DILocation(line: 55, column: 10, scope: !75)
!85 = !DILocation(line: 55, column: 15, scope: !75)
!86 = !DILocation(line: 56, column: 9, scope: !75)
!87 = !DILocation(line: 59, column: 24, scope: !69)
!88 = !DILocation(line: 59, column: 23, scope: !69)
!89 = !DILocation(line: 59, column: 5, scope: !69)
!90 = !DILocation(line: 60, column: 10, scope: !69)
!91 = !DILocation(line: 60, column: 5, scope: !69)
!92 = !DILocation(line: 61, column: 1, scope: !69)
