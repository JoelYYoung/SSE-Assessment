; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_67a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_67a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_67_structType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_67_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %myStruct = alloca %struct._CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_67_structType, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata %struct._CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_67_structType* %myStruct, metadata !19, metadata !DIExpression()), !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  %0 = alloca i8, i64 10, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %data, align 8, !dbg !28
  %2 = load i32*, i32** %data, align 8, !dbg !29
  %structFirst = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_67_structType* %myStruct, i32 0, i32 0, !dbg !30
  store i32* %2, i32** %structFirst, align 8, !dbg !31
  %coerce.dive = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_67_structType* %myStruct, i32 0, i32 0, !dbg !32
  %3 = load i32*, i32** %coerce.dive, align 8, !dbg !32
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_67b_badSink(i32* %3), !dbg !32
  ret void, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_67b_badSink(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_67_good() #0 !dbg !34 {
entry:
  call void @goodG2B(), !dbg !35
  ret void, !dbg !36
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !37 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !43, metadata !DIExpression()), !dbg !44
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !45, metadata !DIExpression()), !dbg !46
  %call = call i64 @time(i64* null) #4, !dbg !47
  %conv = trunc i64 %call to i32, !dbg !48
  call void @srand(i32 %conv) #4, !dbg !49
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !50
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_67_good(), !dbg !51
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !52
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !53
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_67_bad(), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !55
  ret i32 0, !dbg !56
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !57 {
entry:
  %data = alloca i32*, align 8
  %myStruct = alloca %struct._CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_67_structType, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !58, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata %struct._CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_67_structType* %myStruct, metadata !60, metadata !DIExpression()), !dbg !61
  store i32* null, i32** %data, align 8, !dbg !62
  %0 = alloca i8, i64 40, align 16, !dbg !63
  %1 = bitcast i8* %0 to i32*, !dbg !64
  store i32* %1, i32** %data, align 8, !dbg !65
  %2 = load i32*, i32** %data, align 8, !dbg !66
  %structFirst = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_67_structType* %myStruct, i32 0, i32 0, !dbg !67
  store i32* %2, i32** %structFirst, align 8, !dbg !68
  %coerce.dive = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_67_structType* %myStruct, i32 0, i32 0, !dbg !69
  %3 = load i32*, i32** %coerce.dive, align 8, !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_67b_goodG2BSink(i32* %3), !dbg !69
  ret void, !dbg !70
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_67b_goodG2BSink(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_67a.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_67_bad", scope: !14, file: !14, line: 29, type: !15, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_67a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 31, type: !4)
!18 = !DILocation(line: 31, column: 11, scope: !13)
!19 = !DILocalVariable(name: "myStruct", scope: !13, file: !14, line: 32, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_67_structType", file: !14, line: 22, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_67_structType", file: !14, line: 19, size: 64, elements: !22)
!22 = !{!23}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !21, file: !14, line: 21, baseType: !4, size: 64)
!24 = !DILocation(line: 32, column: 67, scope: !13)
!25 = !DILocation(line: 33, column: 10, scope: !13)
!26 = !DILocation(line: 35, column: 19, scope: !13)
!27 = !DILocation(line: 35, column: 12, scope: !13)
!28 = !DILocation(line: 35, column: 10, scope: !13)
!29 = !DILocation(line: 36, column: 28, scope: !13)
!30 = !DILocation(line: 36, column: 14, scope: !13)
!31 = !DILocation(line: 36, column: 26, scope: !13)
!32 = !DILocation(line: 37, column: 5, scope: !13)
!33 = !DILocation(line: 38, column: 1, scope: !13)
!34 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_67_good", scope: !14, file: !14, line: 58, type: !15, scopeLine: 59, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DILocation(line: 60, column: 5, scope: !34)
!36 = !DILocation(line: 61, column: 1, scope: !34)
!37 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 73, type: !38, scopeLine: 74, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DISubroutineType(types: !39)
!39 = !{!5, !5, !40}
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!42 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!43 = !DILocalVariable(name: "argc", arg: 1, scope: !37, file: !14, line: 73, type: !5)
!44 = !DILocation(line: 73, column: 14, scope: !37)
!45 = !DILocalVariable(name: "argv", arg: 2, scope: !37, file: !14, line: 73, type: !40)
!46 = !DILocation(line: 73, column: 27, scope: !37)
!47 = !DILocation(line: 76, column: 22, scope: !37)
!48 = !DILocation(line: 76, column: 12, scope: !37)
!49 = !DILocation(line: 76, column: 5, scope: !37)
!50 = !DILocation(line: 78, column: 5, scope: !37)
!51 = !DILocation(line: 79, column: 5, scope: !37)
!52 = !DILocation(line: 80, column: 5, scope: !37)
!53 = !DILocation(line: 83, column: 5, scope: !37)
!54 = !DILocation(line: 84, column: 5, scope: !37)
!55 = !DILocation(line: 85, column: 5, scope: !37)
!56 = !DILocation(line: 87, column: 5, scope: !37)
!57 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 47, type: !15, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocalVariable(name: "data", scope: !57, file: !14, line: 49, type: !4)
!59 = !DILocation(line: 49, column: 11, scope: !57)
!60 = !DILocalVariable(name: "myStruct", scope: !57, file: !14, line: 50, type: !20)
!61 = !DILocation(line: 50, column: 67, scope: !57)
!62 = !DILocation(line: 51, column: 10, scope: !57)
!63 = !DILocation(line: 53, column: 19, scope: !57)
!64 = !DILocation(line: 53, column: 12, scope: !57)
!65 = !DILocation(line: 53, column: 10, scope: !57)
!66 = !DILocation(line: 54, column: 28, scope: !57)
!67 = !DILocation(line: 54, column: 14, scope: !57)
!68 = !DILocation(line: 54, column: 26, scope: !57)
!69 = !DILocation(line: 55, column: 5, scope: !57)
!70 = !DILocation(line: 56, column: 1, scope: !57)
