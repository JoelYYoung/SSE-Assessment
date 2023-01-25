; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_12_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  store i32* null, i32** %data, align 8, !dbg !19
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !20
  %tobool = icmp ne i32 %call, 0, !dbg !20
  br i1 %tobool, label %if.then, label %if.else, !dbg !22

if.then:                                          ; preds = %entry
  %0 = alloca i8, i64 10, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !25
  store i32* %1, i32** %data, align 8, !dbg !26
  br label %if.end, !dbg !27

if.else:                                          ; preds = %entry
  %2 = alloca i8, i64 40, align 16, !dbg !28
  %3 = bitcast i8* %2 to i32*, !dbg !30
  store i32* %3, i32** %data, align 8, !dbg !31
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !32, metadata !DIExpression()), !dbg !37
  %4 = bitcast [10 x i32]* %source to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !37
  %5 = load i32*, i32** %data, align 8, !dbg !38
  %6 = bitcast i32* %5 to i8*, !dbg !39
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !39
  %7 = bitcast i32* %arraydecay to i8*, !dbg !39
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 40, i1 false), !dbg !39
  %8 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 0, !dbg !40
  %9 = load i32, i32* %arrayidx, align 4, !dbg !40
  call void @printIntLine(i32 %9), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printIntLine(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_12_good() #0 !dbg !43 {
entry:
  call void @goodG2B(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !46 {
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
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_12_good(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_12_bad(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !66 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !67, metadata !DIExpression()), !dbg !68
  store i32* null, i32** %data, align 8, !dbg !69
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !70
  %tobool = icmp ne i32 %call, 0, !dbg !70
  br i1 %tobool, label %if.then, label %if.else, !dbg !72

if.then:                                          ; preds = %entry
  %0 = alloca i8, i64 40, align 16, !dbg !73
  %1 = bitcast i8* %0 to i32*, !dbg !75
  store i32* %1, i32** %data, align 8, !dbg !76
  br label %if.end, !dbg !77

if.else:                                          ; preds = %entry
  %2 = alloca i8, i64 40, align 16, !dbg !78
  %3 = bitcast i8* %2 to i32*, !dbg !80
  store i32* %3, i32** %data, align 8, !dbg !81
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !82, metadata !DIExpression()), !dbg !84
  %4 = bitcast [10 x i32]* %source to i8*, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !84
  %5 = load i32*, i32** %data, align 8, !dbg !85
  %6 = bitcast i32* %5 to i8*, !dbg !86
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !86
  %7 = bitcast i32* %arraydecay to i8*, !dbg !86
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 40, i1 false), !dbg !86
  %8 = load i32*, i32** %data, align 8, !dbg !87
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 0, !dbg !87
  %9 = load i32, i32* %arrayidx, align 4, !dbg !87
  call void @printIntLine(i32 %9), !dbg !88
  ret void, !dbg !89
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_12.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_12_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_12.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 23, type: !4)
!18 = !DILocation(line: 23, column: 11, scope: !13)
!19 = !DILocation(line: 24, column: 10, scope: !13)
!20 = !DILocation(line: 25, column: 8, scope: !21)
!21 = distinct !DILexicalBlock(scope: !13, file: !14, line: 25, column: 8)
!22 = !DILocation(line: 25, column: 8, scope: !13)
!23 = !DILocation(line: 28, column: 23, scope: !24)
!24 = distinct !DILexicalBlock(scope: !21, file: !14, line: 26, column: 5)
!25 = !DILocation(line: 28, column: 16, scope: !24)
!26 = !DILocation(line: 28, column: 14, scope: !24)
!27 = !DILocation(line: 29, column: 5, scope: !24)
!28 = !DILocation(line: 33, column: 23, scope: !29)
!29 = distinct !DILexicalBlock(scope: !21, file: !14, line: 31, column: 5)
!30 = !DILocation(line: 33, column: 16, scope: !29)
!31 = !DILocation(line: 33, column: 14, scope: !29)
!32 = !DILocalVariable(name: "source", scope: !33, file: !14, line: 36, type: !34)
!33 = distinct !DILexicalBlock(scope: !13, file: !14, line: 35, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 10)
!37 = !DILocation(line: 36, column: 13, scope: !33)
!38 = !DILocation(line: 38, column: 17, scope: !33)
!39 = !DILocation(line: 38, column: 9, scope: !33)
!40 = !DILocation(line: 39, column: 22, scope: !33)
!41 = !DILocation(line: 39, column: 9, scope: !33)
!42 = !DILocation(line: 41, column: 1, scope: !13)
!43 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_12_good", scope: !14, file: !14, line: 71, type: !15, scopeLine: 72, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocation(line: 73, column: 5, scope: !43)
!45 = !DILocation(line: 74, column: 1, scope: !43)
!46 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 86, type: !47, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DISubroutineType(types: !48)
!48 = !{!5, !5, !49}
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !14, line: 86, type: !5)
!53 = !DILocation(line: 86, column: 14, scope: !46)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !14, line: 86, type: !49)
!55 = !DILocation(line: 86, column: 27, scope: !46)
!56 = !DILocation(line: 89, column: 22, scope: !46)
!57 = !DILocation(line: 89, column: 12, scope: !46)
!58 = !DILocation(line: 89, column: 5, scope: !46)
!59 = !DILocation(line: 91, column: 5, scope: !46)
!60 = !DILocation(line: 92, column: 5, scope: !46)
!61 = !DILocation(line: 93, column: 5, scope: !46)
!62 = !DILocation(line: 96, column: 5, scope: !46)
!63 = !DILocation(line: 97, column: 5, scope: !46)
!64 = !DILocation(line: 98, column: 5, scope: !46)
!65 = !DILocation(line: 100, column: 5, scope: !46)
!66 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 49, type: !15, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocalVariable(name: "data", scope: !66, file: !14, line: 51, type: !4)
!68 = !DILocation(line: 51, column: 11, scope: !66)
!69 = !DILocation(line: 52, column: 10, scope: !66)
!70 = !DILocation(line: 53, column: 8, scope: !71)
!71 = distinct !DILexicalBlock(scope: !66, file: !14, line: 53, column: 8)
!72 = !DILocation(line: 53, column: 8, scope: !66)
!73 = !DILocation(line: 56, column: 23, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !14, line: 54, column: 5)
!75 = !DILocation(line: 56, column: 16, scope: !74)
!76 = !DILocation(line: 56, column: 14, scope: !74)
!77 = !DILocation(line: 57, column: 5, scope: !74)
!78 = !DILocation(line: 61, column: 23, scope: !79)
!79 = distinct !DILexicalBlock(scope: !71, file: !14, line: 59, column: 5)
!80 = !DILocation(line: 61, column: 16, scope: !79)
!81 = !DILocation(line: 61, column: 14, scope: !79)
!82 = !DILocalVariable(name: "source", scope: !83, file: !14, line: 64, type: !34)
!83 = distinct !DILexicalBlock(scope: !66, file: !14, line: 63, column: 5)
!84 = !DILocation(line: 64, column: 13, scope: !83)
!85 = !DILocation(line: 66, column: 17, scope: !83)
!86 = !DILocation(line: 66, column: 9, scope: !83)
!87 = !DILocation(line: 67, column: 22, scope: !83)
!88 = !DILocation(line: 67, column: 9, scope: !83)
!89 = !DILocation(line: 69, column: 1, scope: !66)
