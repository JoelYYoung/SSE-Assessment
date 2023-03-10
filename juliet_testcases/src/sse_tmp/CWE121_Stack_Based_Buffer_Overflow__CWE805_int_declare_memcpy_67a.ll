; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67_structType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %myStruct = alloca %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67_structType, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67_structType* %myStruct, metadata !19, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !35
  store i32* %arraydecay, i32** %data, align 8, !dbg !36
  %0 = load i32*, i32** %data, align 8, !dbg !37
  %structFirst = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67_structType* %myStruct, i32 0, i32 0, !dbg !38
  store i32* %0, i32** %structFirst, align 8, !dbg !39
  %coerce.dive = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67_structType* %myStruct, i32 0, i32 0, !dbg !40
  %1 = load i32*, i32** %coerce.dive, align 8, !dbg !40
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67b_badSink(i32* %1), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67b_badSink(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67_good() #0 !dbg !42 {
entry:
  call void @goodG2B(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %call = call i64 @time(i64* null) #4, !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 %conv) #4, !dbg !57
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !58
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67_good(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67_bad(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !65 {
entry:
  %data = alloca i32*, align 8
  %myStruct = alloca %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67_structType, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67_structType* %myStruct, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !74
  store i32* %arraydecay, i32** %data, align 8, !dbg !75
  %0 = load i32*, i32** %data, align 8, !dbg !76
  %structFirst = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67_structType* %myStruct, i32 0, i32 0, !dbg !77
  store i32* %0, i32** %structFirst, align 8, !dbg !78
  %coerce.dive = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67_structType* %myStruct, i32 0, i32 0, !dbg !79
  %1 = load i32*, i32** %coerce.dive, align 8, !dbg !79
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67b_goodG2BSink(i32* %1), !dbg !79
  ret void, !dbg !80
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67b_goodG2BSink(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 31, column: 11, scope: !11)
!19 = !DILocalVariable(name: "myStruct", scope: !11, file: !12, line: 32, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67_structType", file: !12, line: 22, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67_structType", file: !12, line: 19, size: 64, elements: !22)
!22 = !{!23}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !21, file: !12, line: 21, baseType: !16, size: 64)
!24 = !DILocation(line: 32, column: 81, scope: !11)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 33, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 33, column: 9, scope: !11)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 34, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 34, column: 9, scope: !11)
!35 = !DILocation(line: 37, column: 12, scope: !11)
!36 = !DILocation(line: 37, column: 10, scope: !11)
!37 = !DILocation(line: 38, column: 28, scope: !11)
!38 = !DILocation(line: 38, column: 14, scope: !11)
!39 = !DILocation(line: 38, column: 26, scope: !11)
!40 = !DILocation(line: 39, column: 5, scope: !11)
!41 = !DILocation(line: 40, column: 1, scope: !11)
!42 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_67_good", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocation(line: 63, column: 5, scope: !42)
!44 = !DILocation(line: 64, column: 1, scope: !42)
!45 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 76, type: !46, scopeLine: 77, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{!17, !17, !48}
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !12, line: 76, type: !17)
!52 = !DILocation(line: 76, column: 14, scope: !45)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !12, line: 76, type: !48)
!54 = !DILocation(line: 76, column: 27, scope: !45)
!55 = !DILocation(line: 79, column: 22, scope: !45)
!56 = !DILocation(line: 79, column: 12, scope: !45)
!57 = !DILocation(line: 79, column: 5, scope: !45)
!58 = !DILocation(line: 81, column: 5, scope: !45)
!59 = !DILocation(line: 82, column: 5, scope: !45)
!60 = !DILocation(line: 83, column: 5, scope: !45)
!61 = !DILocation(line: 86, column: 5, scope: !45)
!62 = !DILocation(line: 87, column: 5, scope: !45)
!63 = !DILocation(line: 88, column: 5, scope: !45)
!64 = !DILocation(line: 90, column: 5, scope: !45)
!65 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 49, type: !13, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocalVariable(name: "data", scope: !65, file: !12, line: 51, type: !16)
!67 = !DILocation(line: 51, column: 11, scope: !65)
!68 = !DILocalVariable(name: "myStruct", scope: !65, file: !12, line: 52, type: !20)
!69 = !DILocation(line: 52, column: 81, scope: !65)
!70 = !DILocalVariable(name: "dataBadBuffer", scope: !65, file: !12, line: 53, type: !26)
!71 = !DILocation(line: 53, column: 9, scope: !65)
!72 = !DILocalVariable(name: "dataGoodBuffer", scope: !65, file: !12, line: 54, type: !31)
!73 = !DILocation(line: 54, column: 9, scope: !65)
!74 = !DILocation(line: 56, column: 12, scope: !65)
!75 = !DILocation(line: 56, column: 10, scope: !65)
!76 = !DILocation(line: 57, column: 28, scope: !65)
!77 = !DILocation(line: 57, column: 14, scope: !65)
!78 = !DILocation(line: 57, column: 26, scope: !65)
!79 = !DILocation(line: 58, column: 5, scope: !65)
!80 = !DILocation(line: 59, column: 1, scope: !65)
