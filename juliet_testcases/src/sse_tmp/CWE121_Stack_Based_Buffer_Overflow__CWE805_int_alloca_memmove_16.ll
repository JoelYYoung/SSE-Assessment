; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_16.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_16_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 200, align 16, !dbg !21
  %1 = bitcast i8* %0 to i32*, !dbg !22
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %2 = alloca i8, i64 400, align 16, !dbg !25
  %3 = bitcast i8* %2 to i32*, !dbg !26
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !24
  br label %while.body, !dbg !27

while.body:                                       ; preds = %entry
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !28
  store i32* %4, i32** %data, align 8, !dbg !30
  br label %while.end, !dbg !31

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !32, metadata !DIExpression()), !dbg !37
  %5 = bitcast [100 x i32]* %source to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !37
  %6 = load i32*, i32** %data, align 8, !dbg !38
  %7 = bitcast i32* %6 to i8*, !dbg !39
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !39
  %8 = bitcast i32* %arraydecay to i8*, !dbg !39
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 400, i1 false), !dbg !39
  %9 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 0, !dbg !40
  %10 = load i32, i32* %arrayidx, align 4, !dbg !40
  call void @printIntLine(i32 %10), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_16_good() #0 !dbg !43 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_16_good(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_16_bad(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !66 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !69, metadata !DIExpression()), !dbg !70
  %0 = alloca i8, i64 200, align 16, !dbg !71
  %1 = bitcast i8* %0 to i32*, !dbg !72
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  %2 = alloca i8, i64 400, align 16, !dbg !75
  %3 = bitcast i8* %2 to i32*, !dbg !76
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !74
  br label %while.body, !dbg !77

while.body:                                       ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !78
  store i32* %4, i32** %data, align 8, !dbg !80
  br label %while.end, !dbg !81

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !82, metadata !DIExpression()), !dbg !84
  %5 = bitcast [100 x i32]* %source to i8*, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !84
  %6 = load i32*, i32** %data, align 8, !dbg !85
  %7 = bitcast i32* %6 to i8*, !dbg !86
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !86
  %8 = bitcast i32* %arraydecay to i8*, !dbg !86
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 400, i1 false), !dbg !86
  %9 = load i32*, i32** %data, align 8, !dbg !87
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 0, !dbg !87
  %10 = load i32, i32* %arrayidx, align 4, !dbg !87
  call void @printIntLine(i32 %10), !dbg !88
  ret void, !dbg !89
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_16.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_16_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_16.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 23, type: !4)
!18 = !DILocation(line: 23, column: 11, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 24, type: !4)
!20 = !DILocation(line: 24, column: 11, scope: !13)
!21 = !DILocation(line: 24, column: 34, scope: !13)
!22 = !DILocation(line: 24, column: 27, scope: !13)
!23 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 25, type: !4)
!24 = !DILocation(line: 25, column: 11, scope: !13)
!25 = !DILocation(line: 25, column: 35, scope: !13)
!26 = !DILocation(line: 25, column: 28, scope: !13)
!27 = !DILocation(line: 26, column: 5, scope: !13)
!28 = !DILocation(line: 30, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 27, column: 5)
!30 = !DILocation(line: 30, column: 14, scope: !29)
!31 = !DILocation(line: 31, column: 9, scope: !29)
!32 = !DILocalVariable(name: "source", scope: !33, file: !14, line: 34, type: !34)
!33 = distinct !DILexicalBlock(scope: !13, file: !14, line: 33, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 34, column: 13, scope: !33)
!38 = !DILocation(line: 36, column: 17, scope: !33)
!39 = !DILocation(line: 36, column: 9, scope: !33)
!40 = !DILocation(line: 37, column: 22, scope: !33)
!41 = !DILocation(line: 37, column: 9, scope: !33)
!42 = !DILocation(line: 39, column: 1, scope: !13)
!43 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_16_good", scope: !14, file: !14, line: 65, type: !15, scopeLine: 66, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocation(line: 67, column: 5, scope: !43)
!45 = !DILocation(line: 68, column: 1, scope: !43)
!46 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 80, type: !47, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DISubroutineType(types: !48)
!48 = !{!5, !5, !49}
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !14, line: 80, type: !5)
!53 = !DILocation(line: 80, column: 14, scope: !46)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !14, line: 80, type: !49)
!55 = !DILocation(line: 80, column: 27, scope: !46)
!56 = !DILocation(line: 83, column: 22, scope: !46)
!57 = !DILocation(line: 83, column: 12, scope: !46)
!58 = !DILocation(line: 83, column: 5, scope: !46)
!59 = !DILocation(line: 85, column: 5, scope: !46)
!60 = !DILocation(line: 86, column: 5, scope: !46)
!61 = !DILocation(line: 87, column: 5, scope: !46)
!62 = !DILocation(line: 90, column: 5, scope: !46)
!63 = !DILocation(line: 91, column: 5, scope: !46)
!64 = !DILocation(line: 92, column: 5, scope: !46)
!65 = !DILocation(line: 94, column: 5, scope: !46)
!66 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 46, type: !15, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocalVariable(name: "data", scope: !66, file: !14, line: 48, type: !4)
!68 = !DILocation(line: 48, column: 11, scope: !66)
!69 = !DILocalVariable(name: "dataBadBuffer", scope: !66, file: !14, line: 49, type: !4)
!70 = !DILocation(line: 49, column: 11, scope: !66)
!71 = !DILocation(line: 49, column: 34, scope: !66)
!72 = !DILocation(line: 49, column: 27, scope: !66)
!73 = !DILocalVariable(name: "dataGoodBuffer", scope: !66, file: !14, line: 50, type: !4)
!74 = !DILocation(line: 50, column: 11, scope: !66)
!75 = !DILocation(line: 50, column: 35, scope: !66)
!76 = !DILocation(line: 50, column: 28, scope: !66)
!77 = !DILocation(line: 51, column: 5, scope: !66)
!78 = !DILocation(line: 54, column: 16, scope: !79)
!79 = distinct !DILexicalBlock(scope: !66, file: !14, line: 52, column: 5)
!80 = !DILocation(line: 54, column: 14, scope: !79)
!81 = !DILocation(line: 55, column: 9, scope: !79)
!82 = !DILocalVariable(name: "source", scope: !83, file: !14, line: 58, type: !34)
!83 = distinct !DILexicalBlock(scope: !66, file: !14, line: 57, column: 5)
!84 = !DILocation(line: 58, column: 13, scope: !83)
!85 = !DILocation(line: 60, column: 17, scope: !83)
!86 = !DILocation(line: 60, column: 9, scope: !83)
!87 = !DILocation(line: 61, column: 22, scope: !83)
!88 = !DILocation(line: 61, column: 9, scope: !83)
!89 = !DILocation(line: 63, column: 1, scope: !66)
