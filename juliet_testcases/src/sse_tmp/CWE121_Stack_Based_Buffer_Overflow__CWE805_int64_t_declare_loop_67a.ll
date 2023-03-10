; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_67a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_67a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_67_structType = type { i64* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_67_bad() #0 !dbg !11 {
entry:
  %data = alloca i64*, align 8
  %myStruct = alloca %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_67_structType, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !15, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_67_structType* %myStruct, metadata !23, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !34, metadata !DIExpression()), !dbg !38
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  store i64* %arraydecay, i64** %data, align 8, !dbg !40
  %0 = load i64*, i64** %data, align 8, !dbg !41
  %structFirst = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_67_structType* %myStruct, i32 0, i32 0, !dbg !42
  store i64* %0, i64** %structFirst, align 8, !dbg !43
  %coerce.dive = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_67_structType* %myStruct, i32 0, i32 0, !dbg !44
  %1 = load i64*, i64** %coerce.dive, align 8, !dbg !44
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_67b_badSink(i64* %1), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_67b_badSink(i64*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_67_good() #0 !dbg !46 {
entry:
  call void @goodG2B(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* null) #4, !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 %conv) #4, !dbg !62
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_67_good(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_67_bad(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !70 {
entry:
  %data = alloca i64*, align 8
  %myStruct = alloca %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_67_structType, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_67_structType* %myStruct, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !79
  store i64* %arraydecay, i64** %data, align 8, !dbg !80
  %0 = load i64*, i64** %data, align 8, !dbg !81
  %structFirst = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_67_structType* %myStruct, i32 0, i32 0, !dbg !82
  store i64* %0, i64** %structFirst, align 8, !dbg !83
  %coerce.dive = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_67_structType* %myStruct, i32 0, i32 0, !dbg !84
  %1 = load i64*, i64** %coerce.dive, align 8, !dbg !84
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_67b_goodG2BSink(i64* %1), !dbg !84
  ret void, !dbg !85
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_67b_goodG2BSink(i64*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_67a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_67_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_67a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !18, line: 27, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !20, line: 44, baseType: !21)
!20 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!21 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!22 = !DILocation(line: 31, column: 15, scope: !11)
!23 = !DILocalVariable(name: "myStruct", scope: !11, file: !12, line: 32, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_67_structType", file: !12, line: 22, baseType: !25)
!25 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_67_structType", file: !12, line: 19, size: 64, elements: !26)
!26 = !{!27}
!27 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !25, file: !12, line: 21, baseType: !16, size: 64)
!28 = !DILocation(line: 32, column: 83, scope: !11)
!29 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 33, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 50)
!33 = !DILocation(line: 33, column: 13, scope: !11)
!34 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 34, type: !35)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 34, column: 13, scope: !11)
!39 = !DILocation(line: 37, column: 12, scope: !11)
!40 = !DILocation(line: 37, column: 10, scope: !11)
!41 = !DILocation(line: 38, column: 28, scope: !11)
!42 = !DILocation(line: 38, column: 14, scope: !11)
!43 = !DILocation(line: 38, column: 26, scope: !11)
!44 = !DILocation(line: 39, column: 5, scope: !11)
!45 = !DILocation(line: 40, column: 1, scope: !11)
!46 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_67_good", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 63, column: 5, scope: !46)
!48 = !DILocation(line: 64, column: 1, scope: !46)
!49 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 76, type: !50, scopeLine: 77, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{!52, !52, !53}
!52 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !12, line: 76, type: !52)
!57 = !DILocation(line: 76, column: 14, scope: !49)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !12, line: 76, type: !53)
!59 = !DILocation(line: 76, column: 27, scope: !49)
!60 = !DILocation(line: 79, column: 22, scope: !49)
!61 = !DILocation(line: 79, column: 12, scope: !49)
!62 = !DILocation(line: 79, column: 5, scope: !49)
!63 = !DILocation(line: 81, column: 5, scope: !49)
!64 = !DILocation(line: 82, column: 5, scope: !49)
!65 = !DILocation(line: 83, column: 5, scope: !49)
!66 = !DILocation(line: 86, column: 5, scope: !49)
!67 = !DILocation(line: 87, column: 5, scope: !49)
!68 = !DILocation(line: 88, column: 5, scope: !49)
!69 = !DILocation(line: 90, column: 5, scope: !49)
!70 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 49, type: !13, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocalVariable(name: "data", scope: !70, file: !12, line: 51, type: !16)
!72 = !DILocation(line: 51, column: 15, scope: !70)
!73 = !DILocalVariable(name: "myStruct", scope: !70, file: !12, line: 52, type: !24)
!74 = !DILocation(line: 52, column: 83, scope: !70)
!75 = !DILocalVariable(name: "dataBadBuffer", scope: !70, file: !12, line: 53, type: !30)
!76 = !DILocation(line: 53, column: 13, scope: !70)
!77 = !DILocalVariable(name: "dataGoodBuffer", scope: !70, file: !12, line: 54, type: !35)
!78 = !DILocation(line: 54, column: 13, scope: !70)
!79 = !DILocation(line: 56, column: 12, scope: !70)
!80 = !DILocation(line: 56, column: 10, scope: !70)
!81 = !DILocation(line: 57, column: 28, scope: !70)
!82 = !DILocation(line: 57, column: 14, scope: !70)
!83 = !DILocation(line: 57, column: 26, scope: !70)
!84 = !DILocation(line: 58, column: 5, scope: !70)
!85 = !DILocation(line: 59, column: 1, scope: !70)
