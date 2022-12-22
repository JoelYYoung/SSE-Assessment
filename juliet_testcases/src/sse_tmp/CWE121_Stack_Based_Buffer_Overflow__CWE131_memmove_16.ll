; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_16.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_16_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  store i32* null, i32** %data, align 8, !dbg !19
  br label %while.body, !dbg !20

while.body:                                       ; preds = %entry
  %0 = alloca i8, i64 10, align 16, !dbg !21
  %1 = bitcast i8* %0 to i32*, !dbg !23
  store i32* %1, i32** %data, align 8, !dbg !24
  br label %while.end, !dbg !25

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !26, metadata !DIExpression()), !dbg !31
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !31
  %3 = load i32*, i32** %data, align 8, !dbg !32
  %4 = bitcast i32* %3 to i8*, !dbg !33
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !33
  %5 = bitcast i32* %arraydecay to i8*, !dbg !33
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 40, i1 false), !dbg !33
  %6 = load i32*, i32** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !34
  %7 = load i32, i32* %arrayidx, align 4, !dbg !34
  call void @printIntLine(i32 %7), !dbg !35
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_16_good() #0 !dbg !37 {
entry:
  call void @goodG2B(), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !40 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !46, metadata !DIExpression()), !dbg !47
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !48, metadata !DIExpression()), !dbg !49
  %call = call i64 @time(i64* null) #6, !dbg !50
  %conv = trunc i64 %call to i32, !dbg !51
  call void @srand(i32 %conv) #6, !dbg !52
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !53
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_16_good(), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !55
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !56
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_16_bad(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !58
  ret i32 0, !dbg !59
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !60 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !61, metadata !DIExpression()), !dbg !62
  store i32* null, i32** %data, align 8, !dbg !63
  br label %while.body, !dbg !64

while.body:                                       ; preds = %entry
  %0 = alloca i8, i64 40, align 16, !dbg !65
  %1 = bitcast i8* %0 to i32*, !dbg !67
  store i32* %1, i32** %data, align 8, !dbg !68
  br label %while.end, !dbg !69

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !70, metadata !DIExpression()), !dbg !72
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !72
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !72
  %3 = load i32*, i32** %data, align 8, !dbg !73
  %4 = bitcast i32* %3 to i8*, !dbg !74
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !74
  %5 = bitcast i32* %arraydecay to i8*, !dbg !74
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 40, i1 false), !dbg !74
  %6 = load i32*, i32** %data, align 8, !dbg !75
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !75
  %7 = load i32, i32* %arrayidx, align 4, !dbg !75
  call void @printIntLine(i32 %7), !dbg !76
  ret void, !dbg !77
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_16.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_16_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_16.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 23, type: !4)
!18 = !DILocation(line: 23, column: 11, scope: !13)
!19 = !DILocation(line: 24, column: 10, scope: !13)
!20 = !DILocation(line: 25, column: 5, scope: !13)
!21 = !DILocation(line: 28, column: 23, scope: !22)
!22 = distinct !DILexicalBlock(scope: !13, file: !14, line: 26, column: 5)
!23 = !DILocation(line: 28, column: 16, scope: !22)
!24 = !DILocation(line: 28, column: 14, scope: !22)
!25 = !DILocation(line: 29, column: 9, scope: !22)
!26 = !DILocalVariable(name: "source", scope: !27, file: !14, line: 32, type: !28)
!27 = distinct !DILexicalBlock(scope: !13, file: !14, line: 31, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 10)
!31 = !DILocation(line: 32, column: 13, scope: !27)
!32 = !DILocation(line: 34, column: 17, scope: !27)
!33 = !DILocation(line: 34, column: 9, scope: !27)
!34 = !DILocation(line: 35, column: 22, scope: !27)
!35 = !DILocation(line: 35, column: 9, scope: !27)
!36 = !DILocation(line: 37, column: 1, scope: !13)
!37 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_16_good", scope: !14, file: !14, line: 62, type: !15, scopeLine: 63, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DILocation(line: 64, column: 5, scope: !37)
!39 = !DILocation(line: 65, column: 1, scope: !37)
!40 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 77, type: !41, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DISubroutineType(types: !42)
!42 = !{!5, !5, !43}
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!45 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!46 = !DILocalVariable(name: "argc", arg: 1, scope: !40, file: !14, line: 77, type: !5)
!47 = !DILocation(line: 77, column: 14, scope: !40)
!48 = !DILocalVariable(name: "argv", arg: 2, scope: !40, file: !14, line: 77, type: !43)
!49 = !DILocation(line: 77, column: 27, scope: !40)
!50 = !DILocation(line: 80, column: 22, scope: !40)
!51 = !DILocation(line: 80, column: 12, scope: !40)
!52 = !DILocation(line: 80, column: 5, scope: !40)
!53 = !DILocation(line: 82, column: 5, scope: !40)
!54 = !DILocation(line: 83, column: 5, scope: !40)
!55 = !DILocation(line: 84, column: 5, scope: !40)
!56 = !DILocation(line: 87, column: 5, scope: !40)
!57 = !DILocation(line: 88, column: 5, scope: !40)
!58 = !DILocation(line: 89, column: 5, scope: !40)
!59 = !DILocation(line: 91, column: 5, scope: !40)
!60 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 44, type: !15, scopeLine: 45, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocalVariable(name: "data", scope: !60, file: !14, line: 46, type: !4)
!62 = !DILocation(line: 46, column: 11, scope: !60)
!63 = !DILocation(line: 47, column: 10, scope: !60)
!64 = !DILocation(line: 48, column: 5, scope: !60)
!65 = !DILocation(line: 51, column: 23, scope: !66)
!66 = distinct !DILexicalBlock(scope: !60, file: !14, line: 49, column: 5)
!67 = !DILocation(line: 51, column: 16, scope: !66)
!68 = !DILocation(line: 51, column: 14, scope: !66)
!69 = !DILocation(line: 52, column: 9, scope: !66)
!70 = !DILocalVariable(name: "source", scope: !71, file: !14, line: 55, type: !28)
!71 = distinct !DILexicalBlock(scope: !60, file: !14, line: 54, column: 5)
!72 = !DILocation(line: 55, column: 13, scope: !71)
!73 = !DILocation(line: 57, column: 17, scope: !71)
!74 = !DILocation(line: 57, column: 9, scope: !71)
!75 = !DILocation(line: 58, column: 22, scope: !71)
!76 = !DILocation(line: 58, column: 9, scope: !71)
!77 = !DILocation(line: 60, column: 1, scope: !60)
